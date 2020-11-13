const pay = () => {
  Payjp.setPublicKey("pk_test_500e7e10f4ca36ce44c89b1b"); // PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("user_purchase[number]"),
      cvc: formData.get("user_purchase[cvc]"),
      exp_month: formData.get("user_purchase[exp_month]"),
      exp_year: `20${formData.get("user_purchase[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
    });
  });
};

window.addEventListener("load", pay);