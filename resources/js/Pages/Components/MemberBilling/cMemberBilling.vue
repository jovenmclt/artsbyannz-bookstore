<template>
     <div class="container-xxl">
        <div class="row justify-content-center">
            <MembershipNavVue :userIds="userIds" :userInfos="userInfos" :userCarts="userCarts" />
            <main class="col-xl-9 col-lg-8 col-md-12 ms-auto justify-content-center px-3 mt-5">
                <section id="sec1">
                    <div class="row justify-content-center">
                        <div class="col-md-10">
                            <div class="text-start">
                                <h2 class="fw-semibold text-white">BILLING HISTORY</h2>
                                <inertiaLink href="/memberprofile" class="fw-light text-secondary"> Profile Settings</inertiaLink>
                                <br><br>
                                <h4 class="fw-light text-white">MEMBERSHIP</h4>
                                <p class="fw-sembibold text-white">You’re currently signed up as a free account.</p>
                                <br>
                            </div>
                            <p class="text-white fs-4 mb-0">PAYMENT HISTORY</p>
                            <div class="table-responsive " style="max-height: 500px; overflow: auto; scrollbar-width: none; ">
                                <table class="table table-hover table-dark caption-top" style="background-color: transparent;">

                                    <thead class="position-sticky top-0">
                                        <tr>
                                            <th scope="col">Date</th>
                                            <th scope="col">Payment method</th>
                                            <th scope="col">Charged for</th>
                                            <th scope="col">Amount</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="(getTransaction, index) in transactions" :key="index">
                                            <td>{{ new Date(getTransaction.created_at).toLocaleDateString('en-US', {year:'numeric', month: 'short', day: 'numeric'}) }}</td>
                                            <td>{{ getTransaction.paymentMethod }}</td>
                                            <td>{{ getTransaction.itemTitle  }}</td>
                                            <td>${{ getTransaction.amount  }}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </section>
            </main>
        </div>
    </div>
</template>

<script>
import MembershipNavVue from '../MembershipNavbar/MembershipNav.vue'
import {Link as inertiaLink} from '@inertiajs/vue3'
export default {
    name: 'cMemberBilling',
    components:{MembershipNavVue, inertiaLink},
    props: { userIds: Number, userInfos: Object, userCarts:Object, transactions:Array},
}
</script>


<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100..700;1,100..700&family=League+Spartan:wght@100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap');

section {
    font-family: "Poppins", serif;
    padding: calc(60px + 1rem) 0;
}
table td{
    font-size: 13px;
    padding: 20px 10px;
    white-space: nowrap;
    color: white
}

table th {
    font-size: 12px;
    color: rgb(231, 224, 224);
    white-space: nowrap;
}

table,
tbody,
tr,
td {
  background-color: transparent !important;
}

</style>
