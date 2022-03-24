class Public::ContactsController < ApplicationController

  # お問い合わせ入力
  def new
    @contact = Contact.new
    render :new
  end

  # お問い合わせ内容確認
  def confirm
    @contact = Contact.new(params[:contact].permit(:name, :email, :message))
    if @Contact.valid?
      # OK。確認画面を表示
      render :confirm
    else
      # NG。入力画面を再表示
      render :new
    end
  end

  def thanks
    # メール送信
    @contact = Contact.new(params[:contact].permit(:name, :email, :message))
    ContactMailer.received_email(@contact).deliver

    # 完了画面を表示
    render :thanks
  end

end
