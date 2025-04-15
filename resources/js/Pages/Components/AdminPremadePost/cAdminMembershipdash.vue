<template>
    <div class="container-xxl">
        <div class="row justify-content-center">
           <AdminNavigation :propsAdmin_images="getcAdmin_images" />
           <main class="col-xl-10 col-md-9 ms-auto justify-content-center px-3 ">
                <section class="" id="sec1">
                    <div class="row justify-content-start">
                        <div class="text-start py-4">
                            <a href="#" class="text-decoration-none text-secondary hover:text-white">
                                <span class="fw-light">Membership > dashboard</span>
                            </a>
                            <div class="d-flex justify-content-between py-3">
                                <h4 class="fw-semibold text-white "> <img width="40" height="40" src="https://img.icons8.com/office/40/conference-call.png" alt="conference-call"/> Membership & Post</h4>
                                <inertiaLink href="/admin/membership/newpost" class="text-decoration-none">
                                    <button class="btn btn-dark border-secondary me-xl-5 rounded-3">New Post</button>
                                </inertiaLink>
                            </div>
                        </div>
                        <div class="col-xl-4 mt-xl-0 mt-2">
                            <div class="text-start py-3 px-3 rounded-4" style="background-color: #2A3335;">
                                <span class="fw-semibold text-secondary bg-transparent">Members </span>
                                <h1 class="fw-bold text-white bg-transparent">{{ getall_users.length }}</h1>
                                <div class="text-end  bg-transparent">
                                    <a href="#sec2"  class=" bg-transparent text-decoration-none">View All</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 mt-xl-0 mt-2">
                            <div class="text-start py-3 px-3 rounded-4" style="background-color: #2A3335;">
                                <span class="fw-semibold text-secondary bg-transparent">Post </span>
                                <h1 class="fw-bold text-white bg-transparent">{{ getall_posts.length }}</h1>
                                <div class="text-end  bg-transparent">
                                    <inertiaLink href="/admin/membership/allpost" class=" bg-transparent text-decoration-none">View All</inertiaLink>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section id="sec2">
                    <div class="row justify-content-center">
                        <div class="col-12">
                            <div class="text-start border-bottom pb-3">
                                <span class="fw-light text-white">List of members</span>
                            </div>
                            <br>
                            <div class="d-flex justify-content-between py-4 px-4 bg-dark rounded-2 gap-2 ">
                                <div class="d-flex gap-2 bg-transparent">
                                    <select class="form-select bg-dark text-white shadow-none border-secondary"
                                        id="inputGroupSelect01" @change="m_enableGroupby" v-model="mmbr_groupBy">
                                        <option selected>Group by</option>
                                        <option value="status">Status</option>
                                    </select>
                                    <select class="form-select bg-dark text-white shadow-none border-secondary"
                                        id="inputGroupSelect01" v-if="mmbr_select1" v-model="mmbr_group1">
                                        <option selected>Select</option>
                                        <option value="Active">Active</option>
                                        <option value="Offline">Offlline</option>
                                    </select>
                                </div>
                                <div class="d-flex align-items-center bg-transparent position-relative">
                                    <i class="bi bi-search bg-transparent text-dark" style="position: absolute; left: 10px;"></i>
                                    <input type="text" class="form-control bg-white border-secondary shadow-none text-dark ps-5"
                                    placeholder="Search Fullname" v-model="mmbr_searchUser">
                                </div>
                            </div>
                            <div class="table-responsive rounded " style="max-height: 900px; overflow-y: auto;  scrollbar-width: none; ">
                                <table class="table caption-top table-hover table-dark text-start">
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
                                            <th class="text-secondary" scope="col">Status</th>
                                            <th scope="col"></th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <tr v-for="(userInfo, index) in m_sortItem" :key="index">
                                            <td class="fw-light" style="font-size: 13px;">{{ userInfo.id }}</td>
                                            <td class="fw-light" style="font-size: 13px;">
                                                <img v-if="userInfo.file_profile" :src="`/storage/${userInfo.file_profile}`" alt="" width="30" height="30" class="rounded-5 p-0">
                                                <img v-else class="bg-transparent" width="30" height="30" src="https://img.icons8.com/color/100/user-male-circle--v1.png" alt="user-male-circle--v1"/>
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
                            <div class="py-3 px-4 bg-dark rounded-2">
                                <div class="text-start bg-transparent ">
                                    <span class="fw-semibold text-primary bg-transparent" style="font-size: 13px;">Showing 1 to {{ getall_users.length }} of {{ getall_users.length }} result.</span>
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
import AdminNavigation from '../AdminNavbar/AdminNavigation.vue'
import {Link as inertiaLink} from '@inertiajs/vue3'
export default {
    name: 'cAdminPremadepost',
    components: {AdminNavigation, inertiaLink},
    props: {getcAdmin_images:Object, getall_posts:Array, getall_users:Object},
    data(){
        return{
            mmbr_sortId: false,
            mmbr_sortIdicon: false,

            mmbr_sortFullname:false,
            mmbr_sortFullnameicon: false,

            mmbr_searchUser: '',
            mmbr_groupBy: 'Group by',
            mmbr_select1: false,
            mmbr_group1: 'Select',
        }
    },
    methods:{
        m_sortID() {
            this.mmbr_sortId = !this.mmbr_sortId
            this.mmbr_sortIdicon = !this.mmbr_sortIdicon,

                this.getall_users.sort((a, b) => {
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

                this.getall_users.sort((a, b) => {
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
        m_enableGroupby() {
            if (this.mmbr_groupBy == 'status') {
                this.mmbr_select1 = true
            } else {
                this.mmbr_select1 = false
            }
        }
    },
    computed: {
        m_sortItem() {
            return this.getall_users.filter((getuser) => {
                const searchUser = getuser.fullname.toLowerCase().includes(this.mmbr_searchUser.toLowerCase());

                let matchesGroup = true;
                if (this.mmbr_groupBy === "status" && this.mmbr_group1) {
                    const UserStatus = getuser.is_active === 1 ? "Active" : "Offline";
                    matchesGroup = UserStatus.toLowerCase() === this.mmbr_group1.toLowerCase();
                }

                return searchUser && matchesGroup;
            })
        }
    },
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
    padding: 15px 20px;
}
</style>
