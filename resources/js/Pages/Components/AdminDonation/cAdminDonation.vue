<template>
    <div class="container-xxl">
        <div class="row jusify-content-center">
            <AdminNavigationVue :propsAdmin_images="getcAdmin_images" />
            <main  class="col-xl-10 col-md-9 ms-auto justify-content-center px-3">
                <section class="" id="sec1">
                    <div class="row justify-content-start">
                        <div class="text-start py-4">
                            <a href="#" class="text-decoration-none text-secondary hover:text-white">
                                <span class="fw-light">Donation > Dashboard</span>
                            </a>
                            <div class="d-flex justify-content-between py-3">
                                <h4 class="fw-semibold text-white "><img width="40" height="40" src="https://img.icons8.com/papercut/50/cheap-2--v2.png" alt="cheap-2--v2"/> Donation</h4>
                            </div>
                        </div>
                        <div class="col-xl-4 mt-xl-0 mt-2">
                            <div class="text-start pt-3  rounded-4" style="background-color: #2A3335;">
                                <span class="fw-semibold text-secondary px-3 bg-transparent">Total Donation</span>
                                <h1 class="fw-bold text-white bg-transparent px-3">${{ rtotalDonation }}</h1>
                                <div class="bg-transparent">
                                    <canvas id="donationChart" class="bg-transparent" style="width: 100%; height: 40px; "></canvas>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 mt-xl-0 mt-2">
                            <div class="text-start pt-3  rounded-4" style="background-color: #2A3335;">
                                <span class="fw-semibold text-secondary px-3 bg-transparent">People</span>
                                <h1 class="fw-bold text-white bg-transparent px-3">{{ get_allDonations.length }}</h1>
                                <div class="bg-transparent">
                                    <canvas id="peopleChart" class="bg-transparent" style="width: 100%; height: 40px; "></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section id="sec2">
                    <div class="row justify-content-start">
                        <div class="col-12">
                            <div class="text-start border-bottom py-3">
                                <span class="fw-light text-white">List of donation</span>
                            </div>
                            <br>
                            <div class="d-flex justify-content-between py-4 px-4 bg-dark rounded-2 gap-2">
                                <div class="text-start bg-transparent">
                                    <button @click="exportData" class="btn btn-outline-secondary fw-semibold"><i class="bi bi-download  bg-transparent"></i> Export</button>
                                </div>
                                <div class="d-flex align-items-center bg-transparent position-relative">
                                    <i class="bi bi-search bg-transparent text-dark" style="position: absolute; left: 10px;"></i>
                                    <input type="text" class="form-control bg-white border-secondary shadow-none text-dark ps-5"
                                        placeholder="Search Fullname" v-model="rsearch">
                                </div>
                            </div>
                            <div id="donationTable" class="table-responsive rounded border-top border-secondary" style="max-height: 900px; overflow: auto; scrollbar-width:none;">
                                <table class="table caption-top table-hover table-dark text-start">
                                    <thead class="position-sticky top-0 bg-secondary z-1">
                                        <tr>
                                            <th scope="col" class="text-secondary" @click="sortID" style="cursor: pointer;">Id
                                                <i  class="bi bi-chevron-down bg-transparent" v-if="!rsortIDicon"></i>
                                                <i  class="bi bi-chevron-up bg-transparent" v-if="rsortIDicon"></i>
                                            </th>
                                            <th scope="col" class="text-secondary">Full Name</th>
                                            <th scope="col" class="text-secondary">Email Address</th>
                                            <th scope="col" class="text-secondary" @click="sortAmount" style="cursor: pointer;">Amount
                                                <i  class="bi bi-chevron-down bg-transparent" v-if="!ramount"></i>
                                                <i  class="bi bi-chevron-up bg-transparent" v-if="ramount"></i>
                                            </th>
                                            <th scope="col" class="text-secondary">Payment Type</th>
                                            <th scope="col" class="text-secondary" @click="sortCompletedDate" style="cursor: pointer;">Date
                                                <i  class="bi bi-chevron-down bg-transparent" v-if="!rsortCompletedDate"></i>
                                                <i  class="bi bi-chevron-up bg-transparent" v-if="rsortCompletedDate"></i>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <template v-for="(donnor, index) in get_computedDonnor" :key="index">
                                            <tr>
                                                <td class="fw-bold" style="font-size: 13px;">{{ donnor.id }}</td>
                                                <td class="fw-light" style="font-size: 13px;">{{ donnor.name }}</td>
                                                <td class="fw-light" style="font-size: 13px;">{{ donnor.email }}</td>
                                                <td class="fw-light"><span class="px-2 py-2 border border-success rounded" style=" font-size: 12px; background-color: rgba(134, 242, 114, 0.2);">${{ donnor.amount }}</span></td>
                                                <td class="fw-light" style="font-size: 13px;">{{ donnor.payment }}</td>
                                                <td class="fw-light" style="font-size: 13px;">{{ new Date(donnor.created_at).toLocaleDateString('en-US',{ year: 'numeric', month: 'short', day: 'numeric' }) }}</td>
                                            </tr>
                                        </template>
                                    </tbody>
                                </table>
                            </div>
                            <div class="py-3 px-4 bg-dark rounded-2">
                                <div class="text-start bg-transparent">
                                    <span class="fw-semibold text-primary bg-transparent" style="font-size: 13px;">Showing 1 to result.</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </main>
        </div>
    </div>
</template>

<script>
import AdminNavigationVue from '../AdminNavbar/AdminNavigation.vue'
import {Link as inertiaLink} from '@inertiajs/vue3'
import html2pdf from 'html2pdf.js'
import Chart from 'chart.js/auto'
export default {
    name:'cAdminDonation',
    components: {AdminNavigationVue, inertiaLink},
    props: {getcAdmin_images:Object, get_allDonations:Array},
    data(){
        return{
            rtotalDonation: '',
            rsearch: '',
            isExporting: false,
            rsortIDicon: false,
            ramount: false,
            rsortCompletedDate: false
        }
    },
    methods:{
        getTotalDonation(){
            let sum = 0
            for(let i = 0; i < this.get_allDonations.length; i++){
                sum += Number(this.get_allDonations[i].amount);
            }
            this.rtotalDonation = sum.toFixed(2);
        },
        sortID() {
            this.rsortIDicon = !this.rsortIDicon,
            this.get_allDonations.sort((a, b) => {
                if (this.rsortIDicon) {
                    if (a.id < b.id) return 1;
                    if (a.id > b.id) return -1;
                    return 0;
                } else {
                    if (a.id < b.id) return -1;
                    if (a.id > b.id) return 1;
                    return 0;
                }
            })
        },
        sortAmount() {
            this.ramount = !this.ramount,
            this.get_allDonations.sort((a, b) => {
                if (this.ramount) {
                    if (a.amount < b.amount) return 1;
                    if (a.amount > b.amount) return -1;
                    return 0;
                } else {
                    if (a.amount < b.amount) return -1;
                    if (a.amount > b.amount) return 1;
                    return 0;
                }
            })
        },
        sortCompletedDate() {
            this.rsortCompletedDate = !this.rsortCompletedDate,
            this.get_allDonations.sort((a, b) => {
                if (this.rsortCompletedDate) {
                    if (a.created_at < b.created_at) return 1;
                    if (a.created_at > b.created_at) return -1;
                    return 0;
                } else {
                    if (a.created_at < b.created_at) return -1;
                    if (a.created_at > b.created_at) return 1;
                    return 0;
                }
            })
        },
        exportData() {
            this.isExporting = !this.isExporting
            const element = document.getElementById('donationTable');
            element.classList.add('pdf-black-background');

            const options = {
                margin: 0.5,
                filename: 'artsbyannz-listofdonation.pdf',
                image: { type: 'png', quality: 0.98 },
                html2canvas: { scale: 1.5, useCORS: true },
                jsPDF: { unit: 'in', format: 'a3', orientation: 'landscape' }
            };

            html2pdf().from(element).set(options).save().then(() => {
                this.isExporting = false
                element.classList.remove('pdf-black-background');
            });
        },
        peopleChart(){
            const ctx = document.getElementById('peopleChart');

            const now = new Date();
            const currentYear = now.getFullYear();
            const currentMonth = now.getMonth();

            const months = ['January', 'February', 'March', 'April', 'May', 'June',
                'July', 'August', 'September', 'October', 'November', 'December'];

            const labels = months.slice(currentMonth).concat(months.slice(0, currentMonth));

            let peopleCount = new Array(12).fill(0);

            this.get_allDonations.filter(people => new Date(people.created_at).getFullYear() === currentYear).forEach(people => {
                let monthIndex = new Date(people.created_at).getMonth();
                peopleCount[monthIndex]++;
            });

            peopleCount = peopleCount.slice(currentMonth).concat(peopleCount.slice(0, currentMonth));

            const data = {
                labels: labels,
                datasets: [{
                    data: peopleCount,
                    borderColor: '#42f57b',
                    fill: true,
                    backgroundColor: 'rgba(66, 245, 123, 0.3)',
                    tension: 0.4
                }]
            };
            const config = {
                type: 'line',
                data: data,
                options: {
                    responsive: true,
                    plugins: { legend: { display: false } },
                    scales: {
                        x: { display: false },
                        y: { display: false }
                    }
                }
            };

            new Chart (ctx,config);
        },
        donationChart(){
            const ctx = document.getElementById('donationChart');

            const now = new Date();
            const currentYear = now.getFullYear();
            const currentMonth = now.getMonth();

            const months = ['January', 'February', 'March', 'April', 'May', 'June',
                'July', 'August', 'September', 'October', 'November', 'December'];

            const labels = months.slice(currentMonth).concat(months.slice(0, currentMonth));

            let donationCount = new Array(12).fill(0);

            this.get_allDonations.filter(getDonation => new Date(getDonation.created_at).getFullYear() === currentYear).forEach(getDonation => {
                let monthIndex = new Date(getDonation.created_at).getMonth();
                donationCount[monthIndex]++;
            });

            donationCount = donationCount.slice(currentMonth).concat(donationCount.slice(0, currentMonth));

            const data = {
                labels: labels,
                datasets: [{
                    data: donationCount,
                    borderColor: '#42f57b',
                    fill: true,
                    backgroundColor: 'rgba(66, 245, 123, 0.3)',
                    tension: 0.4
                }]
            };
            const config = {
                type: 'line',
                data: data,
                options: {
                    responsive: true,
                    plugins: { legend: { display: false } },
                    scales: {
                        x: { display: false },
                        y: { display: false }
                    }
                }
            };

            new Chart (ctx,config);
        },
    },
    computed:{
        get_computedDonnor(){
            return this.get_allDonations.filter(getDonnor =>
                getDonnor.name.toLowerCase().includes(this.rsearch.toLowerCase())
            );

        }
    },
    mounted(){
        this.getTotalDonation();
        this.peopleChart();
        this.donationChart();
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

table th,
table td {
    font-family: "Poppins", serif;
    white-space: nowrap;
    padding: 15px 15px;
}
</style>
