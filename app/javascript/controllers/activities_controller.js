import { Controller } from "@hotwired/stimulus"
import Chart from 'chart.js/auto';

// Connects to data-controller="activities"
export default class extends Controller {
  static targets = ["nap", "food", "bowel", "mood"]
  static values = {
    naps: Array,
    foods: Array,
    bowels: Array,
    moods: Array
  }


  connect() {
    // console.log(this.napsValue)

    var today = new Date();

    const yesterday = new Date(today)
    yesterday.setDate(yesterday.getDate() - 1)

    const dayBefore = new Date(today)
    dayBefore.setDate(yesterday.getDate() - 2)

    const twoDaysBefore = new Date(today)
    twoDaysBefore.setDate(yesterday.getDate() - 3)

    const threeDaysBefore = new Date(today)
    threeDaysBefore.setDate(yesterday.getDate() - 4)

    // today.toDateString()
    // yesterday.toDateString()
    // dayBefore.toDateString()
    // twoDaysBefore.toDateString()
    // console.log(threeDaysBefore.toDateString('en-US', options))
    const options = { weekday: 'long' }


    new Chart(this.napTarget, {
      type: 'line',
      data: {
        labels: [`${threeDaysBefore.toDateString('en-US', options)}`, `${twoDaysBefore.toDateString('en-US', options)}`, `${dayBefore.toDateString('en-US', options)}`, `${yesterday.toDateString('en-US', options)}`, `${today.toDateString('en-US', options)}`],
        datasets: [{
          label: '# of naps',
          data: this.napsValue,
          borderWidth: 1
        }]
      },
      options: {
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    });

  }
}
