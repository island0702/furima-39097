// ページの読み込みが完了した後に実行される処理
window.addEventListener('load', () => {
  // 商品価格の input 要素を取得
  const priceInput = document.getElementById("item-price");
  
  // 販売手数料を表示する要素を取得
  const priceContent = document.getElementById("add-tax-price");
  
  // 販売利益を表示する要素を取得
  const profit = document.getElementById("profit");

  // 商品価格の input 要素に入力があった場合の処理
  priceInput.addEventListener("input", ()  => {
    // 販売手数料を計算して、表示する
    const addTaxPrice = Math.floor(priceInput.value * 0.1);
    priceContent.innerHTML = addTaxPrice;
    
    // 販売利益を計算して、表示する
    profit.innerHTML = priceInput.value - addTaxPrice;
  })
});