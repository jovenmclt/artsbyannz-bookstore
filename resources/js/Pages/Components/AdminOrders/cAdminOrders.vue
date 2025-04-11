<template>
    <div class="container-xxl">
            <div class="row">
                <AdminNavigation :propsAdmin_images="getcAdmin_images"/>
                <main class="col-xl-10 col-md-9 ms-auto justify-content-center px-3 ">
                    <section id="sec1">
                        <div class="row justify-content-start">
                            <div class="text-start py-4">
                                <a href="#" class="text-decoration-none text-secondary hover:text-white">
                                    <span class="fw-light">Orders > List</span>
                                </a>
                                <div class="d-flex justify-content-between py-3">
                                    <h4 class="fw-semibold text-white "><img width="40" height="40" src="https://img.icons8.com/color-glass/48/shopping-cart-loaded.png" alt="shopping-cart-loaded"/> Order Management</h4>
                                </div>
                            </div>
                            <div class="col-md-4 mt-xl-0 mt-2">
                                <div class="text-start py-3 px-3 rounded-4" style="background-color: #2A3335;">
                                    <span class="fw-semibold text-secondary bg-transparent">Total Orders </span>
                                    <h1 class="fw-bold text-white bg-transparent">{{ get_pendingItems.length }}</h1>
                                </div>
                            </div>
                            <div class="col-md-4 mt-xl-0 mt-2">
                                <div class="text-start py-3 px-3 rounded-4" style="background-color: #2A3335;">
                                    <span class="fw-semibold text-secondary bg-transparent">Shipped </span>
                                    <h1 class="fw-bold text-white bg-transparent">{{ get_shipmentItems.length }}</h1>

                                </div>
                            </div>
                            <div class="col-md-4 mt-xl-0 mt-2">
                                <div class="text-start py-3 px-3 rounded-4" style="background-color: #2A3335;">
                                    <span class="fw-semibold text-secondary bg-transparent">Completed </span>
                                    <h1 class="fw-bold text-white bg-transparent">{{ get_completedItems.length }}</h1>
                                </div>
                            </div>
                        </div>
                    </section>
                    <section id="sec2">
                        <div class="row justify-content-center">
                            <div class="col-md-12">
                                <ul class="nav nav-tabs">
                                    <li class="nav-item">
                                        <a class="nav-link bg-transparent active" data-bs-toggle="tab" href="#pendingOrders"><span class="text-white">Pending</span></a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link bg-transparent" href="#shippedOrders" data-bs-toggle="tab"><span class="text-white">Shipped</span></a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link bg-transparent" href="#completedOrders" data-bs-toggle="tab"><span class="text-white">Completed</span></a>
                                    </li>
                                </ul>
                                <div class="tab-content">
                                    <div id="pendingOrders" class="tab-pane fade show active mt-4">
                                        <div v-if="get_pendingItems.length > 0">
                                            <pendingOrder :get_pendingCustomers="get_pendingCustomers" :get_pendingItems="get_pendingItems"/>
                                        </div>
                                        <div v-else>
                                            <h5 class="fw-semibold text-white">The order is currently empty..</h5>
                                        </div>
                                    </div>
                                    <div id="shippedOrders" class="tab-pane fade show mt-4">
                                        <div v-if="get_shipmentItems.length > 0">
                                            <shipmentOrder :get_shipmentCutomers="get_shipmentCutomers" :get_shipmentItems="get_shipmentItems"/>
                                        </div>
                                        <div v-else>
                                            <h5 class="fw-semibold text-white">No items for shipment.</h5>
                                        </div>
                                    </div>
                                    <div id="completedOrders" class="tab-pane fade show mt-4">
                                        <div v-if="get_completedItems.length > 0">
                                            <completedOrder :get_completedCutomers="get_completedCutomers" :get_completedItems="get_completedItems"/>
                                        </div>
                                        <div v-else>
                                            <h5 class="fw-semibold text-white">No items completed.</h5>
                                        </div>
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
    import AdminNavigation from '../AdminNavbar/AdminNavigation.vue';
    import pendingOrder from './pending.vue';
    import shipmentOrder from './shipment.vue';
    import completedOrder from './completed.vue';
    export default {
        name: 'cAdminOrders',
        components:{AdminNavigation, pendingOrder, shipmentOrder, completedOrder},
        props:{getcAdmin_images:Object, get_pendingCustomers:Object, get_pendingItems:Array, get_shipmentCutomers:Object, get_shipmentItems:Array, get_completedCutomers:Object, get_completedItems:Array},
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
