<template>
    <div class="container-xxl">
        <div class="row">
            <AdminNavigation :propsAdmin_images="getcAdmin_images" />
            <main class="col-xl-10 col-md-9 ms-auto justify-content-center px-3">
                <section id="sec1">
                    <div class="row justify-content-start">
                        <div class="text-start mt-3 py-3">
                            <a href="#" class="text-decoration-none text-secondary hover:text-white">
                                <span class="fw-light">Admin > Dashboard</span>
                            </a>
                            <h4 class="fw-bold text-white py-3"><img width="40" height="40" src="https://img.icons8.com/fluency/48/dashboard-layout.png" alt="dashboard-layout"/> Dashboard</h4>
                        </div>
                        <div class="col-xl-5 col-md-8">
                            <div class="d-flex justify-content-between align-items-center px-3 py-3 rounded-4"
                                style="background-color: #2A3335;">
                                <div class="d-flex bg-transparent gap-2">
                                    <div class="text-start bg-transparent pt-2">
                                        <img :src="`/storage/${adminImage}`" alt="" width="50" height="50"
                                            class="rounded-5 bg-transparent">
                                    </div>
                                    <div class="text-start bg-transparent pt-2">
                                        <h5 class="fw-semibold text-white bg-transparent">Welcome</h5>
                                        <p class="fw-light text-white bg-transparent">artsbyannz</p>
                                    </div>
                                </div>
                                <div class="text-end bg-transparent">
                                    <button class="btn btn-dark border-secondary shadow-none" @click="btnLogout">
                                        <i class="bi bi-box-arrow-left fs-6 bg-transparent"> Sign out </i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section id="sec2">
                    <div class="row justify-content-start">
                        <div class="col-md-4">
                            <div class="text-start rounded-4 pt-3" style="background-color: #2A3335;">
                                <span class="fw-semibold px-3 text-secondary bg-transparent">Sales</span>
                                <h1 class="fw-bold text-white px-3 bg-transparent">{{ get_sales.length }}</h1>
                                <div class="bg-transparent">
                                    <canvas id="salechart" class="bg-transparent" style="width: 100%; height: 40px; "></canvas>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 mt-md-0 mt-3">
                            <div class="text-start rounded-4 pt-3" style="background-color: #2A3335;">
                                <span class="fw-semibold px-3 text-secondary bg-transparent">Donations</span>
                                <h1 class="fw-bold text-white px-3 bg-transparent">{{ allUsers.length }}</h1>
                                <div class="bg-transparent">
                                    <canvas id="donationschart" class="bg-transparent" style="width: 100%; height: 40px; "></canvas>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 mt-md-0 mt-3">
                            <div class="text-start rounded-4 pt-3" style="background-color: #2A3335;">
                                <span class="fw-semibold px-3 text-secondary bg-transparent">Total Members    </span>
                                <h1 class="fw-bold text-white px-3 bg-transparent">{{ allUsers.length }}</h1>
                                <div class="bg-transparent">
                                    <canvas id="memberschart" class="bg-transparent" style="width: 100%; height: 40px; "></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section id="sec3">
                    <div class="row justify-content-start">
                        <div class="col-xl-7">
                            <div class="py-4 px-3 bg-dark rounded">
                                <div class="d-flex justify-content-between bg-transparent">
                                    <div class="text-start bg-transparent">
                                        <h6 class="fw-semibold text-secondary bg-transparent pe-2">Income this year: {{ new Date().getFullYear() }}</h6>
                                    </div>
                                    <div class="text-start bg-transparent">
                                        <h6 class="fw-semibold text-white bg-transparent">${{ totalIncome }} </h6>
                                    </div>
                                </div>
                                <div class="bg-transparent">
                                    <canvas id="incomechart" class="bg-transparent" style="height: 350px; width: 100%;  "></canvas>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-5 mt-xl-0 mt-4" >
                           <div class="py-4 px-3 bg-dark rounded">
                                <div class="d-flex justify-content-between bg-transparent pb-3">
                                    <div class="text-start bg-transparent">
                                        <h6 class="fw-semibold text-white bg-transparent pe-2">Art Sales </h6>
                                        <h6 class="fw-light text-secondary bg-transparent pe-2">Leading in sales</h6>
                                    </div>
                                    <div class="btn-group dropstart bg-transparent">
                                        <div class=" bg-transparent" data-bs-toggle="dropdown">
                                            <i class="bi bi-three-dots bg-secondary px-2 rounded text-white" style="cursor: pointer;"></i>
                                        </div>
                                        <ul class="dropdown-menu bg-dark rounded-4 border-secondary px-2 z-1">
                                            <li class="bg-transparent border-bottom py-1">
                                                <inertiaLink :href="`/admin/PremadeCovers`" class="text-decoration-none bg-transparent">
                                                    <span class="text-white bg-transparent" style="font-size: 14px;"><img width="20" height="20" class="bg-transparent me-2" src="https://img.icons8.com/external-flaticons-lineal-color-flat-icons/64/external-cover-literature-flaticons-lineal-color-flat-icons-2.png" alt="external-cover-literature-flaticons-lineal-color-flat-icons-2"/>Premade Cover</span>
                                                </inertiaLink>
                                            </li>
                                            <li class="bg-transparent py-1">
                                                <inertiaLink :href="`/admin/PremadeWallpaper`" class="text-decoration-none bg-transparent">
                                                    <span class="text-white bg-transparent" style="font-size: 14px;"><img width="20" height="20" class="bg-transparent me-2" src="https://img.icons8.com/fluency/48/wallpaper.png" alt="wallpaper"/>Wall Paper</span>
                                                </inertiaLink>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="bg-transparent">
                                    <canvas id="donationChartDoughnut" class="bg-transparent" style="height: 307px; width: 100%;  "></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section id="sec4">
                    <div class="row justify-content-start">
                        <div class="col-xl-5 mt-xl-0 mt-3" >
                            <div class="py-4 px-3 bg-dark rounded" style="height: 426px; width: 100% ; overflow-y: auto; scrollbar-color: #2C3930 #3F4F44;">
                                <div class="d-flex justify-content-between bg-transparent">
                                    <div class="text-start bg-transparent">
                                        <h6 class="fw-semibold text-white bg-transparent">Recent Transactions</h6>
                                        <span class="fw-light text-secondary bg-transparent">Order History</span>
                                    </div>
                                    <button @click="$inertia.visit(`/admin/orders`)" class="btn btn-outline-secondary h-25 px-2" >
                                        <span class="fw-light bg-transparent" style="font-size: 14px;">Order Details</span>
                                    </button>
                                </div>
                                <div class="border border-secondary py-2 px-2 bg-transparent mt-3" v-for="(getItem, index) in get_recentPurchase" :key="index">
                                    <div class="d-flex gap-2 bg-transparent">
                                        <div class="text-start bg-transparent w-25">
                                            <img :src="`/storage/${getItem.itemFile}`" alt="" class="bg-transparent" width="90">
                                        </div>
                                        <div class="text-start w-50 ms-md-2 ms-3 bg-transparent">
                                            <span class="fw-light text-white bg-transparent" style="font-size: 10px;">{{ getItem.itemTitle }}</span><br>
                                            <span class="fw-light text-white bg-transparent" style="font-size: 10px;">To: {{ getItem.clientName }}</span><br>
                                            <span class="fw-light text-white bg-transparent" style="font-size: 10px;">Address: {{ getItem.country }}, {{ getItem.postalCode }}</span>
                                        </div>
                                        <div class="text-start bg-transparent w-25">
                                           <div class="bg-transparent mt-2" v-if="getItem.status == `Completed`">
                                                <br>
                                                <span class="px-2 py-2 rounded text-white " style="background-color:rgba(72, 166, 167, 0.3);  border: 1px solid rgba(91, 143, 185, 1); font-size: 10px;">{{ getItem.status }}</span>
                                           </div>
                                           <div class="bg-transparent mt-2" v-else-if="getItem.status == `Shipped`">
                                                <br>
                                                <span class="px-2 py-2 rounded text-white " style="background-color:rgba(223, 208, 184, 0.3);  border: 1px solid #948979; font-size: 10px;">{{ getItem.status }}</span>
                                           </div>
                                           <div class="bg-transparent mt-2" v-else>
                                                <br>
                                                <span class="px-2 py-2 rounded text-white " style="background-color:rgba(255, 217, 95, 0.3);  border: 1px solid rgba(255, 217, 95, 1); font-size: 10px;">{{ getItem.status }}</span>
                                           </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-7">
                            <div class="py-4 px-3 bg-dark rounded mt-xl-0 mt-4">
                                <div class="d-flex justify-content-between bg-transparent pb-3">
                                    <div class="text-start bg-transparent">
                                        <h6 class="fw-semibold text-white bg-transparent pe-2">List of members</h6>
                                        <span class="fw-light text-secondary bg-transparent">Member status & info</span>
                                    </div>
                                    <button @click="$inertia.visit(`/admin/membership`)" class="btn btn-outline-secondary h-25 px-2" >
                                        <span class="fw-light bg-transparent" style="font-size: 14px;">Membership</span>
                                    </button>
                                </div>
                                <div class="table-responsive rounded bg-transparent" style="max-height: 273px; overflow-y: auto;  scrollbar-width: none; ">
                                    <table class="table caption-top table-hover table-dark text-start ">
                                        <thead class="position-sticky top-0 bg-secondary">
                                            <tr class="">
                                                <th class="text-secondary" scope="col" @click="m_sortID" style="cursor: pointer;">Id
                                                    <i class="bi bi-chevron-down bg-transparent" v-if="!mmbr_sortIdicon"></i>
                                                    <i class="bi bi-chevron-up bg-transparent" v-if="mmbr_sortIdicon"></i>
                                                </th>
                                                <th scope="col"></th>
                                                <th class="text-secondary" scope="col" @click="m_sortFullname" style="cursor: pointer;">Fullname
                                                    <i class="bi bi-chevron-down bg-transparent" v-if="!mmbr_sortFullnameicon"></i>
                                                    <i class="bi bi-chevron-up bg-transparent" v-if="mmbr_sortFullnameicon"></i>
                                                </th>
                                                <th class="text-secondary" scope="col">Email</th>
                                                <th class="text-secondary" scope="col" @click="m_sortStatus" style="cursor: pointer;">Status
                                                    <i class="bi bi-chevron-down bg-transparent" v-if="!mmbr_sortstatus"></i>
                                                    <i class="bi bi-chevron-up bg-transparent" v-if="mmbr_sortstatus"></i>
                                                </th>
                                                <th scope="col"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr v-for="(userInfo, index) in allUsers" :key="index">
                                                <td class="fw-light " style="font-size: 13px;">{{ userInfo.id }}</td>
                                                <td class="fw-light" style="font-size: 13px;">
                                                    <img :src="`/storage/${userInfo.file_profile}`" alt="" width="30" height="30" class="rounded-5 p-0">
                                                </td>
                                                <td class="fw-light" style="font-size: 13px;">{{ userInfo.fullname }}</td>
                                                <td class="fw-light" style="font-size: 13px;">{{ userInfo.email }}</td>
                                                <td class="fw-light" style="font-size: 13px;" v-if="userInfo.is_active === 1">
                                                    <span class="text-white border border-success px-2 py-1 rounded-5" style="background-color: rgba(134, 242, 114, 0.2);">Active</span>
                                                </td>
                                                <td class="fw-light" style="font-size: 13px;" v-else>
                                                    <span class="text-white border border-danger px-2 py-1 rounded-5" style="background-color: rgba(242, 123, 114, 0.3);">Offline</span>
                                                </td>
                                                <td class="fw-light" style="font-size: 13px;">
                                                    <div class="btn-group dropstart bg-transparent">
                                                        <div class=" bg-transparent" data-bs-toggle="dropdown">
                                                            <i class="bi bi-three-dots-vertical bg-transparent" style="cursor: pointer;"></i>
                                                        </div>
                                                        <ul class="dropdown-menu bg-dark rounded-4 border-secondary">
                                                            <li class="bg-transparent">
                                                                <inertiaLink :href="`/logoutUser/${userInfo.id}`" class="dropdown-item text-white bg-transparent" ><i class="bi bi-box-arrow-left bg-transparent"> Sign out</i></inertiaLink>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="pt-3 px-4 bg-dark rounded-2">
                                    <div class="text-start bg-transparent ">
                                        <span class="fw-semibold text-primary bg-transparent" style="font-size: 13px;">Showing 1 to {{ allUsers.length }} of {{ allUsers.length }} result.</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </main>
        </div>
    </div>
    <br>
</template>

<script>
import AdminNavigation from '../AdminNavbar/AdminNavigation.vue';
import { router } from '@inertiajs/vue3'
import { Link as inertiaLink } from '@inertiajs/vue3'
import Chart from 'chart.js/auto'
export default {
    name: 'cAdminDashboard',
    components: { AdminNavigation, inertiaLink },
    props: { getcAdmin_images: Object , allUsers:Array, get_sales:Array, get_incomes:Array, get_recentPurchase:Array, get_itemTypes:Array},
    data() {
        return {
            adminImage: this.getcAdmin_images ? this.getcAdmin_images.file_profile : '',
            totalIncome: 0,

            mmbr_sortId: false,
            mmbr_sortIdicon: false,
            mmbr_sortFullname:false,
            mmbr_sortFullnameicon: false,
            mmbr_sortstatus: false,

            bookCover_container: [],
            wallPaper_container: []
        }
    },
    methods: {
        btnLogout() {
            router.post('/logout');
        },
        membersChart(){
            const ctx = document.getElementById('memberschart');

            const now = new Date();
            const currentYear = now.getFullYear();
            const currentMonth = now.getMonth();

            const months = ['January', 'February', 'March', 'April', 'May', 'June',
                'July', 'August', 'September', 'October', 'November', 'December'];

            const labels = months.slice(currentMonth).concat(months.slice(0, currentMonth));

            let membersCount = new Array(12).fill(0);

            this.allUsers.filter(members => new Date(members.created_at).getFullYear() === currentYear).forEach(members => {
                let monthIndex = new Date(members.created_at).getMonth();
                membersCount[monthIndex]++;
            });

            membersCount = membersCount.slice(currentMonth).concat(membersCount.slice(0, currentMonth));

            const data = {
                labels: labels,
                datasets: [{
                    data: membersCount,
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
            const ctx = document.getElementById('donationschart');
            const data = {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May'],
                datasets: [{
                    data: [6, 2, 50, 10, 40],
                    borderColor: 'rgba(206, 233, 32, 0.8)',
                    fill: true,
                    backgroundColor: 'rgba(206, 233, 32, 0.3)',
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
        salesChart(){
            const ctx = document.getElementById('salechart');

            const now = new Date();
            const currentYear = now.getFullYear();
            const currentMonth = now.getMonth();

            const months = ['January', 'February', 'March', 'April', 'May', 'June',
                'July', 'August', 'September', 'October', 'November', 'December'];

            const labels = months.slice(currentMonth).concat(months.slice(0, currentMonth));

            let salesCount = new Array(12).fill(0);

            this.get_sales.filter(sale => new Date(sale.completedDate).getFullYear() === currentYear).forEach(sale => {
                let monthIndex = new Date(sale.completedDate).getMonth();
                salesCount[monthIndex]++;
            });

            salesCount = salesCount.slice(currentMonth).concat(salesCount.slice(0, currentMonth));


            const data = {
                labels: labels,
                datasets: [{
                    data: salesCount,
                    borderColor: 'rgba(60, 145, 226, 0.8)',
                    fill: true,
                    backgroundColor: 'rgba(60, 145, 226, 0.3)',
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
        incomeChart(){
            const ctx = document.getElementById('incomechart');

            let sum = 0;
            for(let i = 0; i < this.get_incomes.length; i++){
                sum += Number(this.get_incomes[i].amount);
            }
            this.totalIncome = sum.toFixed(2);

            const now = new Date();
            const currentYear = now.getFullYear();
            const currentMonth = now.getMonth();

            const months = ['January', 'February', 'March', 'April', 'May', 'June',
                'July', 'August', 'September', 'October', 'November', 'December'];

            const labels = months.slice(currentMonth).concat(months.slice(0, currentMonth));

            let income_count = new Array(12).fill(0);

            this.get_incomes.filter(getIncome => new Date(getIncome.completedDate).getFullYear() === currentYear).forEach(getIncome => {
                let monthIndex = new Date(getIncome.completedDate).getMonth();
                income_count[monthIndex] += Number(getIncome.amount);
            });

            income_count = income_count.slice(currentMonth).concat(income_count.slice(0, currentMonth));

            const data = {
                labels: labels,
                datasets: [{
                    label: 'Income',
                    data: income_count,
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
                    scales: {
                        y: {
                            beginAtZero: true,
                            grid: { color: 'rgba(255, 255, 255, 0.2)' },
                            beginAtZero: true,
                            ticks: {
                                color: 'white',
                                callback: function(value, index, ticks) {
                                    return '$' + value;
                                }
                            }
                        },
                        x: {
                            grid: { color: 'rgba(255, 255, 255, 0.2)' },
                            ticks: { color: 'white' }
                        }
                    }
                },
            };
            new Chart(ctx, config);
        },
        donationChartDoughnut(){
            const ctx = document.getElementById('donationChartDoughnut');
            for(let i = 0; i < this.get_itemTypes.length; i++){
                if(this.get_itemTypes[i].item_type == "Book Cover"){
                    this.bookCover_container.push(this.get_itemTypes[i].item_type);
                }else{
                    this.wallPaper_container.push(this.get_itemTypes[i].item_type);
                }
            }
            const data = {
                labels: [
                    'Premade Covers',
                    'Wallpaper'
                ],
                datasets: [{
                    label: 'My First Dataset',
                    data: [this.bookCover_container.length, this.wallPaper_container.length],
                    backgroundColor: [
                    'rgb(255, 99, 132)',
                    'rgb(255, 205, 86)'
                    ],
                    hoverOffset: 6
                }]
            };
            const config = {
                type: 'doughnut',
                data: data,
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: { legend: { display: true } },
                    cutout: '50%',
                }
            };
            new Chart(ctx, config);
        },
        m_sortID() {
            this.mmbr_sortId = !this.mmbr_sortId
            this.mmbr_sortIdicon = !this.mmbr_sortIdicon,

                this.allUsers.sort((a, b) => {
                    if (this.mmbr_sortId) {
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
        m_sortFullname() {
            this.mmbr_sortFullname = !this.mmbr_sortFullname
            this.mmbr_sortFullnameicon = !this.mmbr_sortFullnameicon

                this.allUsers.sort((a, b) => {
                    if (this.mmbr_sortFullname) {
                        if (a.fullname < b.fullname) return 1;
                        if (a.fullname > b.fullname) return -1;
                        return 0;
                    } else {
                        if (a.fullname < b.fullname) return -1;
                        if (a.fullname > b.fullname) return 1;
                        return 0;
                    }
                })
        },
        m_sortStatus() {
            this.mmbr_sortstatus = !this.mmbr_sortstatus

                this.allUsers.sort((a, b) => {
                    if (this.mmbr_sortstatus) {
                        if (a.is_active < b.is_active) return 1;
                        if (a.is_active > b.is_active) return -1;
                        return 0;
                    } else {
                        if (a.is_active < b.is_active) return -1;
                        if (a.is_active > b.is_active) return 1;
                        return 0;
                    }
                })
        },

    },
    mounted(){
        this.membersChart();
        this.donationChart();
        this.salesChart();
        this.incomeChart();
        this.donationChartDoughnut();
    }
}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100..700;1,100..700&family=League+Spartan:wght@100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap');

#sec1 {
    font-family: "Poppins", serif;
    padding-top: calc(60px + 1rem);
}
section{
    font-family: "Poppins", serif;
    padding-top: calc(20px + 1rem);
}

table td {
    white-space: nowrap;
    padding-top: 20px;
}
</style>
