class ItemsController < ApplicationController
  before_action :set_item, only: %w(show edit update destroy)

  def index
    @items = Item.all.with_rich_text_description_and_embeds
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash.notice = "#{@item.name} was created."
      redirect_to @item
    else
      redirect_to new_item_path(@item)
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      flash.notice = "#{@item.name} was updated."
      redirect_to @item
    else
      redirect_to edit_item_path(@item)
    end
  end

  def destroy
    if @item.destroy
      flash.notice = "#{@item.name} was deleted."
      redirect_to items_path
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description)
  end
end
