<template>
    <br>
    <div class="d-flex justify-content-between py-4 px-4 bg-dark rounded-2 gap-2">
        <div class="text-start bg-transparent">
            <button @click="exportData" class="btn btn-outline-secondary fw-semibold"><i class="bi bi-download  bg-transparent"></i> Export</button>
        </div>
        <div class="d-flex align-items-center bg-transparent position-relative">
            <i class="bi bi-search bg-transparent text-dark" style="position: absolute; left: 10px;"></i>
            <input type="text" class="form-control bg-white border-secondary shadow-none text-dark ps-5"
                placeholder="Search Title" v-model="rsearch">
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
                    <th scope="col" class="text-secondary"></th>
                    <th scope="col" class="text-secondary">Title</th>
                    <th scope="col" class="text-secondary" @click="sortpurchaseDate" style="cursor: pointer;">Purchase Date
                        <i  class="bi bi-chevron-down bg-transparent" v-if="!rsortPurchaseDate"></i>
                        <i  class="bi bi-chevron-up bg-transparent" v-if="rsortPurchaseDate"></i>
                    </th>
                    <th scope="col" class="text-secondary">Country</th>
                    <th scope="col" class="text-secondary">Postal</th>
                    <th scope="col" class="text-secondary">Payment</th>
                    <th scope="col" class="text-secondary"  @click="sortStatus" style="cursor: pointer;">Status
                        <i  class="bi bi-chevron-down bg-transparent" v-if="!rsortStatus"></i>
                        <i  class="bi bi-chevron-up bg-transparent" v-if="rsortStatus"></i>
                    </th>
                </tr>
            </thead>
            <tbody>
                <template v-for="(customer, index) in get_computedCustomer" :key="index">
                    <tr>
                        <td class="fw-bold" style="font-size: 13px;">{{ customer.id }}</td>
                        <td class="fw-light" style="font-size: 13px;"><img class="rounded" :src="`/storage/${customer.itemFile}`" alt="" width="50"></td>
                        <td class="fw-light" style="font-size: 13px;" v-html="customer.itemTitle.replace(/(.{30})/g, '$1<br>')"></td>
                        <td class="fw-light" style="font-size: 13px;">{{ new Date(customer.created_at).toLocaleDateString('en-US',{ year: 'numeric', month: 'short', day: 'numeric' }) }}</td>
                        <td class="fw-light" style="font-size: 13px;">{{ customer.country }}</td>
                        <td class="fw-light" style="font-size: 13px;">{{ customer.postalCode }}</td>
                        <td class="fw-light" style="font-size: 13px;">{{ customer.paymentMethod }}</td>
                        <td class="fw-semibold" style="font-size: 11px;" v-if="customer.status == 'Pending'">
                            <span class="px-2 py-2 rounded" style="background-color:rgba(255, 217, 95, 0.3);  border: 1px solid rgba(255, 217, 95, 1); ">{{ customer.status }}</span>
                        </td>
                        <td class="fw-semibold" style="font-size: 11px;" v-else-if="customer.status == 'Shipped'">
                            <span class="px-2 py-2 rounded" style="background-color:rgba(223, 208, 184, 0.3);  border: 1px solid #948979 ">{{ customer.status }}</span>
                        </td>
                        <td class="fw-semibold" style="font-size: 11px;" v-else>
                            <span class="px-2 py-2 rounded" style="background-color:rgba(72, 166, 167, 0.3);  border: 1px solid rgba(91, 143, 185, 1); ">{{ customer.status }}</span>
                        </td>
                    </tr>
                </template>
            </tbody>
        </table>
    </div>
    <div class="py-3 px-4 bg-dark rounded-2">
        <div class="text-start bg-transparent">
            <span class="fw-semibold text-primary bg-transparent" style="font-size: 13px;">Showing 1 to {{ get_CustomerCarts.length }} of {{ get_CustomerCarts.length }} result.</span>
        </div>
    </div>
</template>

<script>
import {Link as inertiaLink} from '@inertiajs/vue3'
import html2pdf from 'html2pdf.js'
export default {
    name: 'previousCustomerTable',
    props: { get_CustomerCarts: Array},
    components:{inertiaLink},
    data() {
        return {
            rsearch: '',
            rsortIDicon: false,
            rsortPurchaseDate: false,
            rsortStatus: false
        };
    },
    methods: {
        sortID() {
            this.rsortIDicon = !this.rsortIDicon,
            this.get_CustomerCarts.sort((a, b) => {
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
        sortpurchaseDate() {
            this.rsortPurchaseDate = !this.rsortPurchaseDate,
            this.get_CustomerCarts.sort((a, b) => {
                if (this.rsortPurchaseDate) {
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
        sortStatus() {
            this.rsortStatus = !this.rsortStatus,
            this.get_CustomerCarts.sort((a, b) => {
                if (this.rsortStatus) {
                    if (a.status < b.status) return 1;
                    if (a.status > b.status) return -1;
                    return 0;
                } else {
                    if (a.status < b.status) return -1;
                    if (a.status > b.status) return 1;
                    return 0;
                }
            })
        },
        exportData() {
            const element = document.getElementById('shipmentCustomer');
            element.classList.add('pdf-black-background');

            const options = {
                margin: 0.5,
                filename: `artsbyannz-customer-${this.get_CustomerCarts[0].clientEmail}.pdf`,
                image: { type: 'png', quality: 0.98 },
                html2canvas: { scale: 1.5, useCORS: true },
                jsPDF: { unit: 'in', format: 'a3', orientation: 'landscape' }
            };

            html2pdf().from(element).set(options).save().then(() => {
                element.classList.remove('pdf-black-background');
            });
        }
    },
    computed:{
        get_computedCustomer(){
            return this.get_CustomerCarts.filter(getCustomer =>
                getCustomer.itemTitle.toLowerCase().includes(this.rsearch.toLowerCase())
            );

        }
    }
}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@100..700&family=League+Spartan:wght@100..900&family=Poppins:wght@100..900&family=Roboto:wght@100..900&display=swap');

table td{
    font-family: "Poppins", serif;
    white-space: nowrap;
    padding: 25px 15px;
}
table th{
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
