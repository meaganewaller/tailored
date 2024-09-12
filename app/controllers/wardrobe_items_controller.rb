class WardrobeItemsController < ApplicationController
  before_action :set_wardrobe_item, only: [:show, :edit, :update, :destroy]

  # GET /wardrobe_items
  def index
    @pagy, @wardrobe_items = pagy(WardrobeItem.sort_by_params(params[:sort], sort_direction))

    # Uncomment to authorize with Pundit
    # authorize @wardrobe_items
  end

  # GET /wardrobe_items/1 or /wardrobe_items/1.json
  def show
  end

  # GET /wardrobe_items/new
  def new
    @wardrobe_item = WardrobeItem.new

    # Uncomment to authorize with Pundit
    # authorize @wardrobe_item
  end

  # GET /wardrobe_items/1/edit
  def edit
  end

  # POST /wardrobe_items or /wardrobe_items.json
  def create
    @wardrobe_item = WardrobeItem.new(wardrobe_item_params)

    # Uncomment to authorize with Pundit
    # authorize @wardrobe_item

    respond_to do |format|
      if @wardrobe_item.save
        format.html { redirect_to @wardrobe_item, notice: "Wardrobe item was successfully created." }
        format.json { render :show, status: :created, location: @wardrobe_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @wardrobe_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wardrobe_items/1 or /wardrobe_items/1.json
  def update
    respond_to do |format|
      if @wardrobe_item.update(wardrobe_item_params)
        format.html { redirect_to @wardrobe_item, notice: "Wardrobe item was successfully updated." }
        format.json { render :show, status: :ok, location: @wardrobe_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @wardrobe_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wardrobe_items/1 or /wardrobe_items/1.json
  def destroy
    @wardrobe_item.destroy!
    respond_to do |format|
      format.html { redirect_to wardrobe_items_url, status: :see_other, notice: "Wardrobe item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_wardrobe_item
    @wardrobe_item = WardrobeItem.find(params[:id])

    # Uncomment to authorize with Pundit
    # authorize @wardrobe_item
  rescue ActiveRecord::RecordNotFound
    redirect_to wardrobe_items_path
  end

  # Only allow a list of trusted parameters through.
  def wardrobe_item_params
    params.require(:wardrobe_item).permit(:name, :category, :color, :season, :occasion, :cost, :condition, images: [])

    # Uncomment to use Pundit permitted attributes
    # params.require(:wardrobe_item).permit(policy(@wardrobe_item).permitted_attributes)
  end
end
