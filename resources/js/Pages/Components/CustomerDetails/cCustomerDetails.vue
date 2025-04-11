<template>
    <div class="container-xxl">
        <div class="row">
            <AdminNavigation :propsAdmin_images="getcAdmin_images" />
            <main class="col-xl-10 col-md-9 ms-auto justify-content-center px-3 ">
                <section class="" id="sec1">
                    <div class="row justify-content-start">
                        <div class="text-start py-4">
                            <a href="#" class="text-decoration-none text-secondary hover:text-white">
                                <span class="fw-light">Customer > View</span>
                            </a>
                            <div class="d-flex justify-content-between py-3">
                                <h4 class="fw-semibold text-white ">Customer Details</h4>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="d-flex justify-content-sm-between justify-content-center flex-wrap rounded-4 px-md-3 py-3 bg-dark ">
                                <div class="d-flex align-items-center bg-transparent px-3">
                                    <img width="80" height="80" class="bg-transparent" src="https://img.icons8.com/officel/100/test-account.png" alt="test-account"/>
                                    <div class="text-start ms-2 mt-3 bg-transparent">
                                        <h5 class="fw-semibold text-white bg-transparent">{{ get_cutomerDetails.clientName }}</h5>
                                        <p class="fw-light text-secondary bg-transparent" style="font-size: 11px;">{{ get_cutomerDetails.clientEmail }}</p>
                                    </div>
                                </div>

                                <hr class="border border-2 ms-md-3 d-lg-block d-none">

                                <div class="bg-transparent px-3">
                                    <div class="text-start mt-3 bg-transparent">
                                        <p class="fw-light text-secondary bg-transparent">Personal Information</p>
                                        <p class="fw-light text-white bg-transparent">Email: {{ get_cutomerDetails.clientEmail }}</p>
                                        <p class="fw-light text-white bg-transparent">Country: {{ get_cutomerDetails.country }}</p>
                                        <p class="fw-light text-white bg-transparent">Postal: {{ get_cutomerDetails.postalCode }}</p>
                                    </div>
                                </div>

                                <hr class="border border-2 ms-md-3 d-lg-block d-none">

                                <div class="text-start bg-transparent px-3">
                                    <p class="fw-light text-secondary bg-transparent mt-3">Payment History</p>
                                    <p class="fw-light text-white bg-transparent">Type: {{ get_cutomerDetails.paymentMethod }}</p>
                                    <div class="d-flex gap-4 align-items-center bg-transparent">
                                        <div class="text-start mt-3 bg-transparent">
                                            <h5 class="fw-semibold text-white bg-transparent">{{ get_customerPendings.length }}</h5>
                                            <p class="fw-light text-secondary bg-transparent">Pending</p>
                                        </div>
                                        <div class="text-start mt-3 bg-transparent">
                                            <h5 class="fw-semibold text-white bg-transparent">{{ get_customerShippeds.length }}</h5>
                                            <p class="fw-light text-secondary bg-transparent">Shipped</p>
                                        </div>
                                        <div class="text-start mt-3 bg-transparent">
                                            <h5 class="fw-semibold text-white bg-transparent">{{ get_customerCompleteds.length }}</h5>
                                            <p class="fw-light text-secondary bg-transparent">Completed</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section id="sec2">
                    <div class="row justify-content-start">
                        <div class="col-md-12">
                            <div class="text-start border-bottom pb-3">
                                <span class="fw-light text-white">Customer orders</span>
                            </div>
                            <customerDetailTable :get_CustomerCarts="get_CustomerCarts"/>
                        </div>
                    </div>
                </section>
            </main>
        </div>
    </div>
</template>

<script>
import customerDetailTable from './customerDetailTable.vue';
import AdminNavigation from '../AdminNavbar/AdminNavigation.vue';
export default {
    name: 'cCustomerDetails',
    components: { AdminNavigation, customerDetailTable},
    props: { getcAdmin_images: Object, get_cutomerDetails:Object, get_customerPendings:Array, get_customerShippeds:Array, get_customerCompleteds:Array, get_CustomerCarts:Array},
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
    padding: calc(20px + 1rem) 0;
}
</style>
