import { Controller } from "@hotwired/stimulus"
import Chart from 'chart.js/auto';

// Connects to data-controller="activities"
export default class extends Controller {
  static targets = ["nap", "food", "bowel", "mood"]
  static values = {
    naps: Array,
    foods: Array,
    bowels: Array,
    moods: Array,
    dates: Array,
  }

  connect() {
    // console.log(this.datesValue)

    // var today = new Date();

    // const yesterday = new Date(today)
    // yesterday.setDate(yesterday.getDate() - 1)

    // const dayBefore = new Date(today)
    // dayBefore.setDate(yesterday.getDate() - 2)

    // const twoDaysBefore = new Date(today)
    // twoDaysBefore.setDate(yesterday.getDate() - 3)

    // const threeDaysBefore = new Date(today)
    // threeDaysBefore.setDate(yesterday.getDate() - 4)

    // today.toDateString()
    // yesterday.toDateString()
    // dayBefore.toDateString()
    // twoDaysBefore.toDateString()
    // console.log(threeDaysBefore.toDateString('en-US', options))
    const options = { weekday: 'long' }

    // [`${threeDaysBefore.toDateString('en-US', options)}`, `${twoDaysBefore.toDateString('en-US', options)}`, `${dayBefore.toDateString('en-US', options)}`, `${yesterday.toDateString('en-US', options)}`, `${today.toDateString('en-US', options)}`],

    new Chart(this.napTarget, {
      type: 'line',
      data: {
        labels: this.datesValue,
        datasets: [{
          label: 'nap time (minutes)',
          data: this.napsValue,
          borderWidth: 1
        }]
      },
      options: {
        scales: {
          y: {
            beginAtZero: true
          }
          ticks: {
            precision:0
          }
        }
      }
    });

    new Chart(this.bowelTarget, {
      type: 'bar',
      data: {
        labels: this.datesValue,
        datasets: [{
          label: 'bowel',
          data: this.bowelsValue,
          borderWidth: 1,
          borderColor: '#FF6384',
          backgroundColor: "red",
        }]
      },
      options: {
        scales: {
          y: {
            beginAtZero: true
          }
          ticks: {
              userCallback(label, index, labels) {
                 // only show if whole number
                 if (Math.floor(label) === label) {
                     return label;
                 }
        }
      }
    });

  }
Chart.defaults.backgroundColor = '#FF0099';
Chart.defaults.borderColor = '#36A2EB';
Chart.defaults.color = '#000';
}
