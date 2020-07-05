module ApplicationHelper
  #税込計算 表示 (数値を金額形式で表示)
  def addTax(money,rate)
   taxed_money = (money*rate).round
   "￥"+taxed_money.to_s(:delimited)+"(税込)"#:delimitedで3桁区切り
  end
end
