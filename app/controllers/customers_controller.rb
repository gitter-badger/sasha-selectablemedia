class CustomersController < ApplicationController

  layout proc {|controller| controller.request.xhr? ? false: "application" }

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @customers }
    end
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    render layout: false
  end

  # GET /customers/new
  # GET /customers/new.json
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
    @customer = Customer.find(params[:id])
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(params[:customer])

    if @customer.save
      head :no_content
    else
      render action: "new", status: :unprocessable_entity
    end
  end

  # PUT /customers/1
  # PUT /customers/1.json
  def update
    @customer = Customer.find(params[:id])

    if @customer.update_attributes(params[:customer])
      head :no_content
    else
      render action: "edit", status: :unprocessable_entity
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy

    head :no_content
  end
end
