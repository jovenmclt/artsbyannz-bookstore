<template>
    <div class="container-xxl">
        <div class="row">
            <AdminNavigation :propsAdmin_images="getcAdmin_images" />
            <main class="col-xl-10 col-md-9 ms-auto justify-content-center px-3 ">
                <section class="" id="sec1">
                    <div class="row justify-content-start">
                        <div class="text-start py-4">
                            <a href="#" class="text-decoration-none text-secondary hover:text-white">
                                <span class="fw-light">Customer > List</span>
                            </a>
                            <div class="d-flex justify-content-between py-3">
                                <h4 class="fw-semibold text-white "><img width="40" height="40" src="https://img.icons8.com/external-sbts2018-flat-sbts2018/58/external-most-recent-social-media-sbts2018-flat-sbts2018-1.png" alt="external-most-recent-social-media-sbts2018-flat-sbts2018-1"/> Previous Customer</h4>
                            </div>
                        </div>
                        <div class="col-xl-4 col-md-7 mt-xl-0 mt-2">
                            <div class="text-start py-3 px-3 rounded-4 mt-xl-4 mt-0" style="background-color: #2A3335;">
                                <span class="fw-semibold text-secondary bg-transparent">Past Customer </span>
                                <h1 class="fw-bold text-white bg-transparent">{{ get_recentCutomers.length }}</h1>
                                <div class="text-end d-xl-none d-block bg-transparent">
                                    <i @click="exportChart" style="cursor: pointer;" class="bi bi-download text-white bg-transparent"></i>
                                </div>
                            </div>
                            <div class="text-center mt-4 d-xl-block d-none">
                                <button @click="exportChart" class="btn btn-outline-secondary"><i class="bi bi-download bg-transparent"></i> Export chart</button>
                            </div>
                        </div>
                        <div class="col-xl-8 mt-xl-0 mt-3">
                            <div class="w-100 bg-dark py-2 px-3 rounded">
                                <canvas style="width: 100%; height: 200px; " id="customerChart" class="bg-transparent rounded px-2"></canvas>
                            </div>
                        </div>
                    </div>
                </section>
                <section id="sec2">
                    <div class="row justify-content-center">
                        <div class="col md-12">
                            <div class="text-start border-bottom py-3">
                                <span class="fw-light text-white">List of previous completed customer</span>
                            </div>
                            <previousCustomer :get_recentCutomers="get_recentCutomers"/>
                        </div>
                    </div>
                </section>
            </main>
        </div>
    </div>
</template>

<script>
import AdminNavigation from '../AdminNavbar/AdminNavigation.vue';
import previousCustomer from './previousCustomerTable.vue';
import Chart from 'chart.js/auto';
import html2pdf from 'html2pdf.js';
export default {
    name: 'AdminCustomer',
    components: { AdminNavigation , previousCustomer},
    props: { getcAdmin_images: Object, get_recentCutomers: Array },
    methods:{
        customerChart(){
            const ctx = document.getElementById('customerChart').getContext('2d');

            const now = new Date();
            const currentYear = now.getFullYear();
            const currentMonth = now.getMonth();

            const months = ['January', 'February', 'March', 'April', 'May', 'June',
                'July', 'August', 'September', 'October', 'November', 'December'];

            const labels = months.slice(currentMonth).concat(months.slice(0, currentMonth));

            let customerCounts = new Array(12).fill(0);

            this.get_recentCutomers.filter(customer => new Date(customer.completedDate).getFullYear() === currentYear).forEach(customer => {
                let monthIndex = new Date(customer.completedDate).getMonth();
                customerCounts[monthIndex]++;
            });

            customerCounts = customerCounts.slice(currentMonth).concat(customerCounts.slice(0, currentMonth));

            const data = {
                labels: labels,
                datasets: [{
                    label: `Customer chart - yr${currentYear}`,
                    data: customerCounts,
                    backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(255, 159, 64, 0.2)',
                    'rgba(255, 205, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(201, 203, 207, 0.2)'
                    ],
                    borderColor: [
                    'rgb(255, 99, 132)',
                    'rgb(255, 159, 64)',
                    'rgb(255, 205, 86)',
                    'rgb(75, 192, 192)',
                    'rgb(54, 162, 235)',
                    'rgb(153, 102, 255)',
                    'rgb(201, 203, 207)'
                    ],
                    borderWidth: 1
                }]
            };

            const config = {
                type: 'bar',
                data: data,
                options: {
                    plugins: {
                        legend: {labels: { color: 'white' }}
                    },
                    scales: {
                        x: {
                            ticks: { color: 'white' },
                            grid: { color: 'rgba(255, 255, 255, 0.2)' },
                        },
                        y: {
                            beginAtZero: true, ticks: { color: 'white' },
                            grid: { color: 'rgba(255, 255, 255, 0.2)' },
                        }
                    }
                },
            };

            new Chart(ctx, config);
        },
        exportChart() {
            const chartCanvas = document.getElementById('customerChart');
            const chartInstance = Chart.getChart(chartCanvas);

            if (!chartInstance) return;

            // Store original label colors
            const originalLegendColor = chartInstance.options.plugins.legend.labels.color;
            const originalXTicksColor = chartInstance.options.scales.x.ticks.color;
            const originalYTicksColor = chartInstance.options.scales.y.ticks.color;

            // Change label colors to black for export
            chartInstance.options.plugins.legend.labels.color = 'black';
            chartInstance.options.scales.x.ticks.color = 'black';
            chartInstance.options.scales.y.ticks.color = 'black';
            chartInstance.options.scales.y.grid.color = 'rgba(0, 0, 0, 0.2)';
            chartInstance.options.scales.x.grid.color = 'rgba(0, 0, 0, 0.2)';
            chartInstance.update();

            setTimeout(() => {
                const options = {
                    margin: 0.5,
                    filename: 'artsbyannz-customerchart.pdf',
                    image: { type: 'png', quality: 0.98 },
                    html2canvas: { scale: 1.5, useCORS: true },
                    jsPDF: { unit: 'in', format: 'a3', orientation: 'landscape' }
                };

                html2pdf().from(chartCanvas).set(options).save().then(() => {
                    chartInstance.options.plugins.legend.labels.color = originalLegendColor;
                    chartInstance.options.scales.x.ticks.color = originalXTicksColor;
                    chartInstance.options.scales.y.ticks.color = originalYTicksColor;
                    chartInstance.options.scales.y.grid.color = 'rgba(255, 255, 255, 0.2)';
                    chartInstance.options.scales.x.grid.color = 'rgba(255, 255, 255, 0.2)';
                    chartInstance.update();
                });
            }, 300);
        }
    },
    mounted() {
        this.customerChart();
        console.log(this.get_recentCutomers);

    }
}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100..700;1,100..700&family=League+Spartan:wght@100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap');

#sec1 {
    font-family: "Poppins", serif;
    padding-top: calc(60px + 1rem);
}

section {
    font-family: "Poppins", serif;
    padding: calc(10px + 1rem) 0;
}
</style>
