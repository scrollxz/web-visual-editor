import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ['element']
  static values = { websiteId: String, elementId: String, elementObject: Object }

  connect() {
    const el = this.elementTarget;
    const elementObject = this.elementObjectValue;

    let isDragging = false;    
    let isResizing = false;

    let offsetX = 0;
    let offsetY = 24;
    let newOffSetX = el.offsetLeft
    let newOffSetY = el.offsetTop


    let startWidth = el.offsetWidth;
    let startHeight = el.offsetHeight;
    let startX = el.offsetWidth;
    let startY = el.offsetHeight;

    el.addEventListener('mousedown', (e) => {
      document.body.style.cursor = 'move'

      if (e.shiftKey) {
        isDragging = false;
        isResizing = true;

        startX = e.clientX;
        startY = e.clientY;
        

        return;
      }

      isDragging = true;
      document.body.style.cursor = 'move'
    })

    document.addEventListener('mousemove', (e) => {
      if (isResizing) {
        el.style.transform = `scale: ${startWidth + (e.clientX - startX)}px`;
        el.style.height = `${startHeight + (e.clientY - startY)}px`;
      }

      if (isDragging) {
        newOffSetX = e.clientX - offsetX
        newOffSetY = e.clientY - offsetY

        el.style.left = `${e.clientX - offsetX}px`
        el.style.top = `${e.clientY - offsetY}px`
      }
    })

    document.addEventListener('mouseup', (e) => {
      isResizing = false;
      isDragging = false;
      document.body.style.cursor = 'auto'

      this.submitChanges(newOffSetX, newOffSetY)
    })
  }

  submitChanges(offsetX, offsetY) {
    fetch(`/elements/${this.elementIdValue}`, { method: 'PUT',
                             headers: { 'Content-Type': 'application/json' },
                             body: JSON.stringify({website_id: this.websiteIdValue, element: { x: offsetX, y: offsetY }})})
  }
}
