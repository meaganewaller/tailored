# frozen_string_literal: true

# View helpers related to user accounts
module AccountsHelper
  def personal_account_owner?(account)
    account.personal? && account.owner_id == current_user&.id
  end

  def avatar_image_tag(url, account, options)
    image_tag(url, class: options[:class], alt: account.name)
  end

  def account_avatar(account, options = {}) # rubocop:disable Metrics/AbcSize
    size = options[:size] || 48
    classes = options[:class]

    return avatar_image_tag(avatar_url_for(current_user, options), account, options) if personal_account_owner?(account)

    if account.avatar.attached? && account.avatar.variable?
      return avatar_image_tag(account.avatar.variant(resize_to_fit: [size, size]), account, options)
    end

    content = tag.span(account.name.to_s.first, class: "initials")
    content += image_tag(avatar_url_for(current_user), class: "avatar-small") if options[:include_user]

    tag.span(content, class: "avatar #{classes}")
  end

  def account_user_roles(account, account_user)
    roles = []
    roles << "Owner" if account_user.respond_to?(:user_id) && account.owner_id == account_user.user_id
    AccountUser::ROLES.each do |role|
      roles << role.to_s.humanize if account_user.public_send(:"#{role}?")
    end
    roles
  end

  def account_admin?(account, account_user)
    AccountUser.find_by(account:, user: account_user)&.admin?
  end

  # A link to switch the account
  #
  # For session switching, we'll use a button_to and submit to the server
  # For path switching, we'll link to the path
  # For subdomains, we can simply link to the subdomain
  # For domains, we can link to the domain (assuming it's configured correctly)
  #
  # The button/link label defaults to the account name, can be overriden with either:
  #   * options[:label]
  #   * Ruby block
  def switch_account_button(account, **options, &block) # rubocop:disable Metrics/AbcSize
    label = block ? nil : options.fetch(:label, account.name)

    # if Jumpstart::Multitenancy.domain? && account.domain?
    #   link_to *[name, account.domain].compact, options, &block
    if Jumpstart::Multitenancy.subdomain? && account.subdomain?
      link_to(*[label, root_url(subdomain: account.subdomain)].compact, options, &block)
    elsif Jumpstart::Multitenancy.path?
      link_to(*[label, root_url(script_name: "/#{account.id}")].compact, options, &block)
    else
      button_to(*[label, switch_account_path(account, return_to: options[:return_to])].compact,
        options.merge(method: :patch), &block)
    end
  end
end
