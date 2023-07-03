class ArticlesController < ApplicationController
  # セットアップ: レコードを取得する前に実行
  before_action :set_article, only: [:show, :update, :destroy]


  def index
    @articles = Article.all
  end
  
  # POST /<model_name_plural>
  # レコードの作成
  def create
    @article = Article.new(article_params)

    # レコードが保存できれば、レコードをJSONとして返す
    # 保存できなければ、エラーメッセージを返す
    if @article.save
      render json: @article, status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # GET /<model_name_plural>/:id
  # レコードの取得
  def show
    render json: @article
  end

  # PUT /<model_name_plural>/:id
  # レコードの更新
  def update
    # レコードが更新できれば、レコードをJSONとして返す
    # 更新できなければ、エラーメッセージを返す
    if @article.update(article_params)
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # DELETE /<model_name_plural>/:id
  # レコードの削除
  def destroy
    @article.destroy
    head :no_content
  end

  private
    # レコードを取得するためのメソッド
    def set_article
      @article = Article.find_by!(slug: params[:slug])
    end

    # 許可されたパラメータのリスト
    def article_params
      params.require(:article).permit(:title, :description, :body)
    end
end