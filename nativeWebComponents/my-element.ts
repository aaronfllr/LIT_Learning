import {LitElement, html} from 'lit';
import {customElement, property} from 'lit/decorators.js';

@customElement('my-element')
export class MyElement extends LitElement {
  @property()
  version = 'STARTING';

  render() {
    return html`
    <p>Welcome to the Lit tutorial!</p>
    <p>This is the ${this.version} code.</p>
    `;
  }
}


//Stopping point, setting up lit still

// const template = document.createElement("template");
// template.innerHTML = `
// <p>Welcome to the Lit tutorial!</p>
// <p>This is the code.</p>
// <button>Hey</button>
// `
// class MyElement extends HTMLElement {
//     constructor() {
//         super();
//         (this as any)._shadowRoot = this.attachShadow({ "mode": "open" });
//         (this as any)._shadowRoot.appendChild(template.content.cloneNode(true));
//     }
//     version = "Aaron";
// }
// window.customElements.define("my-element", MyElement);
