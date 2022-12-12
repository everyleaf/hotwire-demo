import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "name", "body", "icon" ]

  submit() {
    const isAllInput = this.nameTarget.value !== "" &&
     this.bodyTarget.value !== "" &&
     this.iconTargets.some((icon) => { return icon.checked } )

    if(isAllInput) {
      this.element.requestSubmit()
     } else {
       alert("すべての項目を入力してください")
       event.preventDefault()
    }
  }
}
