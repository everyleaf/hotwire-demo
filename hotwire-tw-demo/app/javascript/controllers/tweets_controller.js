import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  submit() {

    const isAllInput = document.getElementById("tweet_name").value !== "" &&
     document.getElementById("tweet_body").value !== "" &&
     (document.getElementById("tweet_icon_smile").checked ||
       document.getElementById("tweet_icon_love").checked ||
       document.getElementById("tweet_icon_angry").checked)

    if(isAllInput) {
      this.element.requestSubmit()
     } else {
       alert("すべての項目を入力してください")
       event.preventDefault()
    }
  }
}
