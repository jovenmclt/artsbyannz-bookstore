<template>
    <div class="container-xxl">
        <div class="row justify-content-center px-3">
            <main class="col-12 justify-content-center align-items-center">
                <section id="sec1">
                    <div class="row justify-content-center">
                        <div class="col-xl-5 col-md-8 col-12">
                            <div class="py-5 px-3 bg-dark border border-secondary rounded ">
                                <div class="bg-transparent" id="divReceipt">
                                    <div class="text-center bg-transparent">
                                        <img src="./Assets/logo.png" alt="" class="bg-transparent w-50">
                                    </div>
                                    <br><br>
                                    <div class="text-start bg-transparent border-bottom pb-3">
                                        <h5 class="fw-bold text-white bg-transparent">Your Order Confirmed!</h5>
                                        <br>
                                        <h6 class="fw-semibold text-white bg-transparent">Hello {{
                                            latestCheckouts.clientName }},</h6>
                                        <p class="fw-light text-white bg-transparent" style="font-size: 13px;">Your
                                            order has been confirmed and will be shipping within next two days.</p>
                                    </div>
                                    <div
                                        class="text-start py-3 d-flex gap-4 flex-wrap bg-transparent border-bottom pb-3">
                                        <div class="text-start bg-transparent">
                                            <span class="fw-light text-white bg-transparent"
                                                style="font-size: 13px;">Order date</span>
                                            <h5 class="fw-semibold text-white bg-transparent" style="font-size: 14px;">
                                                {{ new Date(latestCheckouts.created_at).toLocaleDateString('en-US',
                                                    { year: 'numeric', month: 'short', day: 'numeric' }) }}
                                            </h5>
                                        </div>
                                        <div class="text-start bg-transparent">
                                            <span class="fw-light text-white bg-transparent"
                                                style="font-size: 13px;">Payment Id</span>
                                            <h5 class="fw-semibold text-white bg-transparent" style="font-size: 14px;">
                                                {{ latestCheckouts.payment_id }}</h5>
                                        </div>
                                        <div class="text-start bg-transparent">
                                            <span class="fw-light text-white bg-transparent"
                                                style="font-size: 13px;">Payment</span>
                                            <h5 class="fw-semibold text-white bg-transparent" style="font-size: 14px;">
                                                {{ latestCheckouts.paymentMethod }}</h5>
                                        </div>
                                        <div class="text-start bg-transparent">
                                            <span class="fw-light text-white bg-transparent"
                                                style="font-size: 13px;">Shipping Address</span>
                                            <h5 class="fw-semibold text-white bg-transparent" style="font-size: 14px;">
                                                {{ latestCheckouts.country }}, {{ latestCheckouts.postalCode }}</h5>
                                        </div>
                                    </div>
                                    <div class="py-3 d-flex bg-transparent border-bottom pb-3">
                                        <img :src="`/storage/${latestCheckouts.itemFile}`" alt="" class=" rounded-3"
                                            width="130">
                                        <div class="text-start bg-transparent mt-3">
                                            <p class="fw-semibold text-white bg-transparent ms-2"
                                                style="font-size: 14px;">{{ latestCheckouts.itemTitle }}</p>
                                            <p class="fw-light text-white bg-transparent ms-2" style="font-size: 13px;">
                                                Quantity: {{ latestCheckouts.quantity }}</p>
                                            <p class="fw-light text-white bg-transparent ms-2" style="font-size: 13px;">
                                                Amount: ${{ latestCheckouts.amount }}</p>
                                        </div>
                                    </div>
                                    <div class="text-end py-3 bg-transparent">
                                        <p class="fw-semibold text-white bg-transparent ms-2" style="font-size: 13px;">
                                            Subtotal: ${{ latestCheckouts.amount }}</p>
                                    </div>
                                    <div class="text-start bg-transparent">
                                        <p class="fw-light text-white bg-transparent" style="font-size: 13px;">I'll be
                                            sending a shipping confirmation email when the items shipped successfully!
                                        </p>
                                        <h5 class="fw-bold text-white bg-transparent" style="font-size: 14px;">Thankyou
                                            for shoppping!</h5>
                                        <p class="fw-light text-secondary bg-transparent" style="font-size: 13px;">
                                            artsbyannz</p>
                                    </div>
                                </div>
                                <div class="text-start bg-transparent ">
                                    <i @click="btnprintReceipt"
                                        class="bi bi-file-earmark-arrow-down bg-transparent text-white fs-3"
                                        style="cursor: pointer;"></i>
                                </div>
                                <div class="text-end bg-transparent">
                                    <inertiaLink href="/" class="bg-transparent text-secondary">Continue<i
                                            class="bi bi-arrow-right bg-transparent"></i></inertiaLink><br>
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
import html2pdf from 'html2pdf.js'
import { Link as inertiaLink } from '@inertiajs/vue3'
export default {
    name: 'cReceipt',
    components: { inertiaLink },
    props: { latestCheckouts: Object },
    data() {
        return {

        }
    },
    methods: {
        btnprintReceipt() {
            const element = document.getElementById('divReceipt');
            element.classList.add('pdf-black-background');
            const options = {
                margin: 0.5,
                filename: 'artsbyannz-bookshop-receipt.pdf',
                image: { type: 'png', quality: 0.98 },
                html2canvas: { scale: 2, useCORS: true },
                jsPDF: { unit: 'in', format: 'letter', orientation: 'portrait' }
            };

            html2pdf().from(element).set(options).save().then(() => {
                element.classList.remove('pdf-black-background');
            });
        }
    }


}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100..700;1,100..700&family=League+Spartan:wght@100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap');

section {
    font-family: "Poppins", serif;
    padding: calc(60px + 1rem) 0;
}

.pdf-black-background {
    background-color: rgb(40, 39, 39) !important;
    color: white !important;
    padding: 20px;
    border-radius: 10px;
}
</style>
