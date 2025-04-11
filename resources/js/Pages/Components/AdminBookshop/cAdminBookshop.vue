<template>
    <div class="container-xxl">
        <div class="row">
            <AdminNavigationVue :propsAdmin_images="getcAdmin_images"/>
            <main class="col-xl-10 col-md-9 ms-auto justify-content-center px-3 ">
                <section class="" id="sec1">
                    <div class="row justify-content-start">
                        <div class="text-start py-4">
                            <a href="#" class="text-decoration-none text-secondary hover:text-white">
                                <span class="fw-light">Book shop > List</span>
                            </a>
                            <div class="d-flex justify-content-between py-3">
                                <h4 class="fw-semibold text-white "><img width="40" height="40" src="https://img.icons8.com/external-flaticons-lineal-color-flat-icons/64/external-book-shop-literature-flaticons-lineal-color-flat-icons-2.png" alt="external-book-shop-literature-flaticons-lineal-color-flat-icons-2"/> Book Shop</h4>
                                <inertiaLink href="/admin/additem" class="text-decoration-none">
                                    <button class="btn btn-dark border-secondary me-xl-5 rounded-3">Add New</button>
                                </inertiaLink>
                            </div>
                        </div>
                        <div class="col-xl-4 mt-xl-0 mt-2">
                            <div class="text-start py-3 px-3 rounded-4" style="background-color: #2A3335;">
                                <span class="fw-semibold text-secondary bg-transparent">Premade Cover</span>
                                <h1 class="fw-bold text-white bg-transparent">{{ bookCover.length }}</h1>
                                <div class="text-end  bg-transparent">
                                    <inertiaLink :href="`/admin/PremadeCovers`"
                                        class=" bg-transparent text-decoration-none">View All</inertiaLink>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 mt-xl-0 mt-2">
                            <div class="text-start py-3 px-3 rounded-4" style="background-color: #2A3335;">
                                <span class="fw-semibold text-secondary bg-transparent">Wallpaper</span>
                                <h1 class="fw-bold text-white bg-transparent">{{ Wallpaper.length }}</h1>
                                <div class="text-end  bg-transparent">
                                    <inertiaLink :href="`/admin/PremadeWallpaper`" class=" bg-transparent text-decoration-none">View All</inertiaLink>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section id="sec2">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="text-start border-bottom pb-3">
                                <span class="fw-light text-white">Premade Book Cover & WallPaper</span>
                            </div>
                            <br>
                            <div class="d-flex justify-content-between py-4 px-4 bg-dark rounded-2 gap-2">
                                <div class="d-flex gap-2">
                                    <select class="form-select bg-dark text-white shadow-none border-secondary"
                                        id="inputGroupSelect01" @change="enableGroupby" v-model="groupby">
                                        <option selected>Group by</option>
                                        <option value="type">Type</option>
                                        <option value="status">Status</option>
                                    </select>
                                    <select class="form-select bg-dark text-white shadow-none border-secondary"
                                        id="inputGroupSelect01" v-if="select1" v-model="selectGroup1">
                                        <option selected v>Select</option>
                                        <option value="Book Cover">Book Cover</option>
                                        <option value="WallPaper">WallPaper</option>
                                    </select>
                                    <select class="form-select bg-dark text-white shadow-none border-secondary"
                                        id="inputGroupSelect01" v-if="select2" v-model="selectGroup2">
                                        <option selected>Select</option>
                                        <option value="available">Available</option>
                                        <option value="soldout">Sold out</option>
                                    </select>
                                </div>
                                <div class="d-flex align-items-center bg-transparent position-relative">
                                    <i class="bi bi-search bg-transparent text-dark"
                                        style="position: absolute; left: 10px;"></i>
                                    <input type="text"
                                        class="form-control bg-white border-secondary shadow-none text-dark ps-5"
                                        placeholder="Search Title" v-model="searchpremade">
                                </div>
                            </div>
                            <div class="table-responsive rounded border-top border-secondary"
                                style="max-height: 900px; overflow-y: auto;  scrollbar-width: none; ">
                                <table class="table caption-top table-hover table-dark text-start">
                                    <thead class="position-sticky top-0 bg-secondary text-secondary z-1">
                                        <tr>
                                            <th scope="col"></th>
                                            <th scope="col" class="text-secondary" @click="sortID" style="cursor: pointer;">ID <i
                                                    class="bi bi-chevron-down bg-transparent" v-if="!rsortIDicon"></i>
                                                <i class="bi bi-chevron-up bg-transparent" v-if="rsortIDicon"></i>
                                            </th>
                                            <th scope="col" class="text-secondary">Title</th>
                                            <th scope="col" class="text-secondary" @click="sortOrigprice" style="cursor: pointer;">Original
                                                Price <i class="bi bi-chevron-down bg-transparent"
                                                    v-if="!rsortOrigpriceIcon"></i> <i
                                                    class="bi bi-chevron-up bg-transparent"
                                                    v-if="rsortOrigpriceIcon"></i></th>
                                            <th scope="col" class="text-secondary" @click="sortDiscountprice" style="cursor: pointer;">Discount
                                                Price <i class="bi bi-chevron-down bg-transparent"
                                                    v-if="!rsortdispriceicon"></i> <i
                                                    class="bi bi-chevron-up bg-transparent"
                                                    v-if="rsortdispriceicon"></i></th>
                                            <th scope="col" class="text-secondary">Available</th>
                                            <th scope="col" class="text-secondary">Type</th>
                                            <th scope="col"></th>
                                            <th scope="col"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="(getall, index) in sortItem" :key="index">
                                            <th></th>
                                            <th scope="row" class="fw-light" style="font-size: 13px;">{{ getall.id }}
                                            </th>
                                            <td class="fw-light" style="font-size: 13px;">{{ getall.title }}</td>
                                            <td class="fw-light" style="font-size: 13px;">${{ getall.original_price }}
                                            </td>
                                            <td class="fw-light" style="font-size: 13px;">${{ getall.discount_price }}
                                            </td>
                                            <td v-if="getall.status === 1" class="fw-light" style="font-size: 13px; color: #43C375;"><i class="bi bi-check-circle bg-transparent"></i></td>
                                            <td v-else class="fw-semibold text-danger" style="font-size: 13px; color: #F87171;"><i class="bi bi-x-circle bg-transparent"></i></td>
                                            <td class="fw-light" style="font-size: 13px;">{{ getall.type }}</td>
                                            <td>
                                                <div class="btn-group dropstart bg-transparent z-0">
                                                    <div class=" bg-transparent" data-bs-toggle="dropdown">
                                                        <i class="bi bi-three-dots-vertical bg-transparent" style="cursor: pointer;"></i>
                                                    </div>
                                                    <ul class="dropdown-menu bg-dark rounded-4 border-secondary">
                                                        <li class="bg-transparent mx-3 py-1">
                                                            <inertiaLink :href="`/viewItem/${getall.id}`" method="get" class="text-decoration-none bg-transparent fw-semibold "
                                                                style="font-size: 13px; color: #219B9D;">
                                                                <i class="bi bi-eye-fill bg-transparent ps-1"></i>
                                                                <span class="fw-semibold bg-transparent "> Open</span>
                                                            </inertiaLink>
                                                        </li>
                                                        <li class="bg-transparent mx-3 border-top py-1">
                                                            <inertiaLink :href="`/EditItem/${getall.id}`" class="text-decoration-none bg-transparent fw-semibold" style="font-size: 13px; color: #A1D6B2;">
                                                                <i class="bi bi-pencil-square bg-transparent ps-1"> </i>
                                                                <span class="fw-semibold bg-transparent "> Edit</span>
                                                            </inertiaLink>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </td>
                                            <td></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="py-3 px-4 bg-dark rounded-2">
                                <div class="text-start bg-transparent ">
                                    <span class="fw-semibold text-primary bg-transparent" style="font-size: 13px;">Showing 1 to {{ premade_item.length }} of {{ premade_item.length }} result.</span>
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
import { Link as inertiaLink } from '@inertiajs/vue3'
export default {
    name: 'cAdminBookshop',
    components: { AdminNavigationVue, inertiaLink },
    props: { premade_item: Array , getcAdmin_images:Object},
    data() {
        return {
            bookCover: [],
            Wallpaper: [],
            rsortID: false,
            rsortIDicon: false,

            rsortOrigprice: false,
            rsortOrigpriceIcon: false,

            rsortDiscountprice: false,
            rsortdispriceicon: false,

            searchpremade: '',
            groupby: 'Group by',
            select1: false,
            select2: false,
            selectGroup1: 'Select',
            selectGroup2: 'Select'
        }
    },
    methods: {
        totalOfBookcover() {
            if (this.premade_item.length > 0) {
                for (let i = 0; i < this.premade_item.length; i++) {
                    if (this.premade_item[i].type === 'Book Cover') {
                        this.bookCover.push(this.premade_item[i].title);
                    }
                }
            }
        },
        totalOfWallPaper() {
            if (this.premade_item.length > 0) {
                for (let i = 0; i < this.premade_item.length; i++) {
                    if (this.premade_item[i].type === 'WallPaper') {
                        this.Wallpaper.push(this.premade_item[i].title);
                    }
                }
            }
        },
        sortID() {
            this.rsortID = !this.rsortID
            this.rsortIDicon = !this.rsortIDicon,

                this.premade_item.sort((a, b) => {
                    if (this.rsortID) {
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
        sortOrigprice() {
            this.rsortOrigprice = !this.rsortOrigprice
            this.rsortOrigpriceIcon = !this.rsortOrigpriceIcon

            this.premade_item.sort((a, b) => {
                if (this.rsortOrigprice) {
                    if (a.original_price < b.original_price) return 1;
                    if (a.original_price > b.original_price) return -1;
                    return 0;
                } else {
                    if (a.original_price < b.original_price) return -1;
                    if (a.original_price > b.original_price) return 1;
                    return 0;
                }
            })
        },
        sortDiscountprice() {
            this.rsortDiscountprice = !this.rsortDiscountprice
            this.rsortdispriceicon = !this.rsortdispriceicon
            this.premade_item.sort((a, b) => {
                if (this.rsortDiscountprice) {
                    if (a.discount_price < b.discount_price) return 1;
                    if (a.discount_price > b.discount_price) return -1;
                    return 0;
                } else {
                    if (a.discount_price < b.discount_price) return -1;
                    if (a.discount_price > b.discount_price) return 1;
                    return 0;
                }
            })
        },
        enableGroupby() {
            if (this.groupby == 'type') {
                this.select1 = true
                this.select2 = false
                this.selectGroup2 = "Select"
            } else if (this.groupby == 'status') {
                this.select2 = true
                this.select1 = false
                this.selectGroup1 = "Select"
            } else {
                this.select1 = false
                this.select2 = false
            }
        }
    },
    computed: {
        sortItem() {
            return this.premade_item.filter((getitem) => {
                const searchItem = getitem.title.toLowerCase().includes(this.searchpremade.toLowerCase());

                let matchesGroup = true;
                if (this.groupby === "type" && this.selectGroup1) {
                    matchesGroup = getitem.type.toLowerCase() === this.selectGroup1.toLowerCase();
                } else if (this.groupby === "status" && this.selectGroup2) {
                    const statusText = getitem.status === 1 ? "available" : "soldout";
                    matchesGroup = statusText === this.selectGroup2.toLowerCase();
                }

                return searchItem && matchesGroup;
            })
        }
    },
    mounted() {
        this.totalOfBookcover();
        this.totalOfWallPaper();
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
    white-space: nowrap;
    padding: 15px 5px;
}
</style>
