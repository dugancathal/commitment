class DeploymentsController < GithubController
  before_action :set_repo
  before_action :set_deployment, only: [:show, :edit, :update, :destroy]
  before_filter :owns_deployment?

  # GET /deployments
  # GET /deployments.json
  def index
    @deployments = Deployment.all
  end

  # GET /deployments/1
  # GET /deployments/1.json
  def show
  end

  # GET /deployments/new
  def new
    @deployment = Deployment.new
  end

  # GET /deployments/1/edit
  def edit
  end

  # POST /deployments
  # POST /deployments.json
  def create
    @deployment = Deployment.new(deployment_params)

    respond_to do |format|
      if @deployment.save
        format.html { redirect_to repo_deployment_path(@repo.id, @deployment), notice: 'Deployment was successfully created.' }
        format.json { render :show, status: :created, location: @deployment }
      else
        format.html { render :new }
        format.json { render json: @deployment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deployments/1
  # PATCH/PUT /deployments/1.json
  def update
    respond_to do |format|
      if @deployment.update(deployment_params)
        format.html { redirect_to repo_deployment_path(@repo.id, @deployment), notice: 'Deployment was successfully updated.' }
        format.json { render :show, status: :ok, location: @deployment }
      else
        format.html { render :edit }
        format.json { render json: @deployment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deployments/1
  # DELETE /deployments/1.json
  def destroy
    @deployment.destroy
    respond_to do |format|
      format.html { redirect_to repo_path(owner: @repo.owner.login, id: @repo.id), notice: 'Deployment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_repo
    @repo = Repo.new(github.repo(params[:repo_id].to_i))
  end

  def set_deployment
    @deployment = Deployment.find_by('id = ? OR name = ?', params[:id], params[:id])
  end

  def deployment_params
    params.require(:deployment)
      .permit(:from, :upto, :name)
      .merge(repo_id: @repo.id, owner_id: current_user.id)
  end

  def owns_deployment?
    redirect_to root_path unless @repo
  end
end
