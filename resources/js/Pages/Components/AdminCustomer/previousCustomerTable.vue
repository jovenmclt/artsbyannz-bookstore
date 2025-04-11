<template>
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
    <div id="shipmentCustomer" class="table-responsive rounded border-top border-secondary" style="max-height: 900px; overflow: auto; scrollbar-width:none;">
        <table class="table caption-top table-hover table-dark text-start">
            <thead class="position-sticky top-0 bg-secondary z-1">
                <tr>
                    <th scope="col" class="text-secondary" @click="sortID" style="cursor: pointer;">Id
                        <i  class="bi bi-chevron-down bg-transparent" v-if="!rsortIDicon"></i>
                        <i  class="bi bi-chevron-up bg-transparent" v-if="rsortIDicon"></i>
                    </th>
                    <th scope="col" class="text-secondary">Customer</th>
                    <th scope="col" class="text-secondary">Email Address</th>
                    <th scope="col" class="text-secondary" @click="sortCompletedDate" style="cursor: pointer;">Completed Date
                        <i  class="bi bi-chevron-down bg-transparent" v-if="!rsortCompletedDate"></i>
                        <i  class="bi bi-chevron-up bg-transparent" v-if="rsortCompletedDate"></i>
                    </th>
                    <th scope="col" class="text-secondary">Country</th>
                    <th scope="col" class="text-secondary">Postal</th>
                    <th scope="col" class="text-secondary"></th>
                </tr>
            </thead>
            <tbody>
                <template v-for="(customer, index) in get_computedCustomer" :key="index">
                    <tr>
                        <td class="fw-bold" style="font-size: 13px;">{{ customer.id }}</td>
                        <td class="fw-light" style="font-size: 13px;">{{ customer.clientName }}</td>
                        <td class="fw-light" style="font-size: 13px;">{{ customer.clientEmail }}</td>
                        <td class="fw-light" style="font-size: 13px;">{{ new Date(customer.completedDate).toLocaleDateString('en-US',{ year: 'numeric', month: 'short', day: 'numeric' }) }}</td>
                        <td class="fw-light" style="font-size: 13px;">{{ customer.country }}</td>
                        <td class="fw-light" style="font-size: 13px;">{{ customer.postalCode }}</td>
                        <td>
                            <div class="btn-group dropstart bg-transparent">
                                <div class=" bg-transparent" data-bs-toggle="dropdown">
                                    <i class="bi bi-three-dots-vertical bg-transparent" style="cursor: pointer;"></i>
                                </div>
                                <ul class="dropdown-menu bg-dark rounded-4 border-secondary">
                                    <li class="bg-transparent px-3">
                                        <inertiaLink :href="`/customerdetails/${customer.id}`" class="text-decoration-none bg-transparent">
                                            <span class="text-white bg-transparent"><i class="bi bi-eye-fill bg-transparent text-primary fs-5"></i> View Customer</span>
                                        </inertiaLink>
                                    </li>
                                </ul>
                            </div>
                        </td>
                    </tr>
                </template>
            </tbody>
        </table>
    </div>
    <div class="py-3 px-4 bg-dark rounded-2">
        <div class="text-start bg-transparent">
            <span class="fw-semibold text-primary bg-transparent" style="font-size: 13px;">Showing 1 to {{ get_recentCutomers.length }} of {{ get_recentCutomers.length }} result.</span>
        </div>
    </div>
</template>

<script>
import {Link as inertiaLink} from '@inertiajs/vue3'
import {router} from '@inertiajs/vue3'
import html2pdf from 'html2pdf.js'
export default {
    name: 'previousCustomerTable',
    props: { get_recentCutomers: Array},
    components:{inertiaLink},
    data() {
        return {
            rsearch: '',
            isExporting: false,
            rsortIDicon: false,
            rsortCompletedDate: false
        };
    },
    methods: {
        sortID() {
            this.rsortIDicon = !this.rsortIDicon,
            this.get_recentCutomers.sort((a, b) => {
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
        sortCompletedDate() {
            this.rsortCompletedDate = !this.rsortCompletedDate,
            this.get_recentCutomers.sort((a, b) => {
                if (this.rsortCompletedDate) {
                    if (a.completedDate < b.completedDate) return 1;
                    if (a.completedDate > b.completedDate) return -1;
                    return 0;
                } else {
                    if (a.completedDate < b.completedDate) return -1;
                    if (a.completedDate > b.completedDate) return 1;
                    return 0;
                }
            })
        },
        exportData() {
            this.isExporting = !this.isExporting
            const element = document.getElementById('shipmentCustomer');
            element.classList.add('pdf-black-background');

            const options = {
                margin: 0.5,
                filename: 'artsbyannz-listofcustomer.pdf',
                image: { type: 'png', quality: 0.98 },
                html2canvas: { scale: 1.5, useCORS: true },
                jsPDF: { unit: 'in', format: 'a3', orientation: 'landscape' }
            };

            html2pdf().from(element).set(options).save().then(() => {
                this.isExporting = false
                element.classList.remove('pdf-black-background');
            });
        }
    },
    computed:{
        get_computedCustomer(){
            return this.get_recentCutomers.filter(getCustomer =>
                getCustomer.clientName.toLowerCase().includes(this.rsearch.toLowerCase())
            );

        }
    }
}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@100..700&family=League+Spartan:wght@100..900&family=Poppins:wght@100..900&family=Roboto:wght@100..900&display=swap');

table th,
table td {
    font-family: "Poppins", serif;
    white-space: nowrap;
    padding: 15px 15px;
}
.pdf-black-background {
    background-color: rgb(40, 39, 39) !important;
    color: white !important;
    padding: 20px;
}
</style>
