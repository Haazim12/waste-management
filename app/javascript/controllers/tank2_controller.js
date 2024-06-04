import { Controller } from "@hotwired/stimulus";

import { Chart, registerables } from "chart.js";
Chart.register(...registerables);

export default class extends Controller {
  static targets = ["myChart2"];

  canvasContext() {
    return this.myChart2Target.getContext("2d");
  }

  connect() {
    console.log("Connected from tank2_controller.js");

    let element = document.querySelector("[data-chart2-data-value]");
    // Parse the JSON data
    let chartData = JSON.parse(element.dataset.chart2DataValue);

    const usedPercentage =
      (chartData.datasets[0].data[1] / chartData.datasets[0].data[0]) * 100;
    const remainingPercentage = 100 - usedPercentage;

    // Now you can use chartData in your JavaScript code
    console.log(chartData.labels);
    new Chart(this.canvasContext(), {
      type: "pie",
      data: {
        labels: chartData.labels[0],
        datasets: [
          {
            label: chartData.datasets.label,
            data: [usedPercentage, remainingPercentage],
            backgroundColor: [
              "rgba(255, 99, 132, 0.2)",
              "rgba(54, 162, 235, 0.2)",
            ],
            borderColor: ["rgba(255, 99, 132, 1)", "rgba(54, 162, 235, 1)"],
            borderWidth: 1,
          },
        ],
      },
      options: {},
    });
  }
}
