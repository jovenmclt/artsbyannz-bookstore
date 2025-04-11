<template>
    <br>
    <div class="d-flex justify-content-between py-4 px-4 bg-dark rounded-2 gap-2">
        <div class="text-start bg-transparent">
            <button @click="exportData" class="btn btn-outline-secondary fw-semibold"><i
                    class="bi bi-download  bg-transparent"></i> Export</button>
        </div>
        <div class="d-flex align-items-center bg-transparent position-relative">
            <i class="bi bi-search bg-transparent text-dark" style="position: absolute; left: 10px;"></i>
            <input type="text" class="form-control bg-white border-secondary shadow-none text-dark ps-5"
                placeholder="Search Fullname" v-model="rsearch">
        </div>
    </div>
    <div id="pendingCustomer" class="table-responsive rounded border-top border-secondary"
        style="max-height: 900px; overflow: auto; scrollbar-width:inherit;">
        <table class="table caption-top table-hover table-dark text-start">
            <thead class="position-sticky top-0 bg-secondary">
                <tr>
                    <th scope="col" class="text-secondary" @click="sortID" style="cursor: pointer;">Id
                        <i class="bi bi-chevron-down bg-transparent" v-if="!rsortIDicon"></i>
                        <i class="bi bi-chevron-up bg-transparent" v-if="rsortIDicon"></i>
                    </th>
                    <th scope="col" class="text-secondary">Customer</th>
                    <th scope="col" class="text-secondary">Email Address</th>
                    <th scope="col" class="text-secondary" @click="sortPurchaseDate" style="cursor: pointer;">Purchase Date
                        <i  class="bi bi-chevron-down bg-transparent" v-if="!rsortPurchaseDate"></i>
                        <i  class="bi bi-chevron-up bg-transparent" v-if="rsortPurchaseDate"></i>
                    </th>
                    <th scope="col" class="text-secondary">Payment Status</th>
                    <th scope="col" class="text-secondary">Status</th>
                    <th scope="col" class="text-secondary"></th>
                </tr>
            </thead>
            <tbody>
                <template v-for="(customer, index) in get_computedCustomer" :key="customer.id">
                    <tr>
                        <td class="fw-light" style="font-size: 13px;">{{ customer.id }}</td>
                        <td class="fw-light" style="font-size: 13px;">{{ customer.clientName }}</td>
                        <td class="fw-light" style="font-size: 13px;">{{ customer.clientEmail }}</td>
                        <td class="fw-light" style="font-size: 13px;">{{ new
                            Date(customer.created_at).toLocaleDateString('en-US', {
                                year: 'numeric', month: 'short', day:
                                    'numeric'
                            }) }}</td>
                        <td class="fw-light" style="font-size: 13px;">{{ customer.paymentStats }}</td>
                        <td class="fw-semibold" style="font-size: 11px;">
                            <span class="px-2 py-2 rounded"
                                style="background-color:rgba(255, 217, 95, 0.3);  border: 1px solid rgba(255, 217, 95, 1); ">{{
                                    customer.status }}</span>
                        </td>
                        <td> <img class="bg-transparent toggle-icon" width="25" height="25"
                                src="https://img.icons8.com/office/40/circled-chevron-down.png" alt="toggle"
                                @click="toggleCollapse(index)" style="cursor: pointer;" />
                        </td>
                    </tr>
                    <tr v-if="isExporting || collapsedRow === index">
                        <td colspan="7">
                            <table class="table table-bordered table-dark">
                                <thead>
                                    <tr>
                                        <th class="text-secondary">Payment Id</th>
                                        <th class="text-secondary"></th>
                                        <th class="text-secondary">Title</th>
                                        <th class="text-secondary">Quantity</th>
                                        <th class="text-secondary">Amount</th>
                                        <th class="text-secondary">Payment</th>
                                        <th class="text-secondary">Country</th>
                                        <th class="text-secondary">Postal</th>
                                        <th class="text-secondary"><img class="bg-transparent " width="30" height="30"
                                                src="https://img.icons8.com/stickers/50/airplane-front-view.png"
                                                alt="airplane-front-view" /></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr v-for="(pending, subIndex) in get_pendingItems.filter(p => p.clientEmail === customer.clientEmail)"
                                        :key="subIndex">
                                        <td class="fw-light" style="font-size: 13px;">{{ pending.payment_id }}</td>
                                        <td>
                                            <inertiaLink :href="`/viewItem/${pending.premade_id}`"><img
                                                    :src="`/storage/${pending.itemFile}`" alt="" width="50"
                                                    class="rounded"></inertiaLink>
                                        </td>
                                        <td class="fw-light" style="font-size: 13px;"
                                            v-html="pending.itemTitle.replace(/(.{30})/g, '$1<br>')"></td>
                                        <td class="fw-light" style="font-size: 13px;">{{ pending.quantity }}</td>
                                        <td class="fw-light" style="font-size: 10px;"><span
                                                class="px-2 py-2 border border-success rounded"
                                                style="background-color: rgba(134, 242, 114, 0.2);">${{ pending.amount
                                                }}</span></td>
                                        <td class="fw-light" style="font-size: 13px;">{{ pending.paymentMethod }}</td>
                                        <td class="fw-light" style="font-size: 13px;">{{ pending.country }}</td>
                                        <td class="fw-light" style="font-size: 13px;">{{ pending.postalCode }}</td>
                                        <td>
                                            <div class="btn-group dropstart bg-transparent">
                                                <div class=" bg-transparent" data-bs-toggle="dropdown">
                                                    <i class="bi bi-three-dots-vertical bg-transparent"
                                                        style="cursor: pointer;"></i>
                                                </div>
                                                <ul class="dropdown-menu bg-dark rounded-4 border-secondary">
                                                    <li class="bg-transparent px-3">
                                                        <button @click="btnstoreShipment(pending.id)"
                                                            class="btn btn-outline-none bg-transparent">
                                                            <img width="25" height="25" class="bg-transparent"
                                                                src="https://img.icons8.com/color/50/truck--v1.png"
                                                                alt="truck--v1" />
                                                            <span class="text-white bg-transparent"> Ready for
                                                                shipment</span>
                                                        </button>
                                                    </li>
                                                </ul>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </template>
            </tbody>
        </table>
    </div>
    <div class="py-3 px-4 bg-dark rounded-2">
        <div class="text-start bg-transparent">
            <span class="fw-semibold text-primary bg-transparent" style="font-size: 13px;">Showing 1 to {{
                get_pendingItems.length }} of {{ get_pendingItems.length }} result.</span>
        </div>
    </div>
</template>

<script>
import { Link as inertiaLink } from '@inertiajs/vue3'
import { router } from '@inertiajs/vue3'
import html2pdf from 'html2pdf.js'
export default {
    name: 'pending',
    props: { get_pendingCustomers: Object, get_pendingItems: Array },
    components: { inertiaLink },
    data() {
        return {
            collapsedRow: null,
            rcustomerId: null,
            rsearch: '',
            isExporting: false,
            rsortIDicon: false,
            rsortPurchaseDate: false
        };
    },
    methods: {
        sortID() {
            this.rsortIDicon = !this.rsortIDicon,
                this.get_pendingCustomers.sort((a, b) => {
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
        sortPurchaseDate() {
            this.rsortPurchaseDate = !this.rsortPurchaseDate
                this.get_pendingCustomers.sort((a, b) => {
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
        toggleCollapse(index) {
            this.collapsedRow = this.collapsedRow === index ? null : index;
        },
        btnstoreShipment(customerId) {
            this.rcustomerId = customerId;
            if (this.rcustomerId) {
                const data = {
                    updateStatus: "Shipped",
                }
                router.post(`/shipment/${this.rcustomerId}`, data);
            }
        },
        exportData() {
            this.isExporting = !this.isExporting
            const element = document.getElementById('pendingCustomer');
            element.classList.add('pdf-black-background');

            const options = {
                margin: 0.5,
                filename: 'artsbyannz-pendingcustomer.pdf',
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
    computed: {
        get_computedCustomer() {
            return this.get_pendingCustomers.filter(getCustomer =>
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
    border-radius: 10px;
}
</style>
