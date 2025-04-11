<template>
    <cCheckout :itemCheckouts="itemCheckout" :errors="errors" />
</template>

<script>
import cCheckout from '../Components/Checkout/cCheckout.vue';
export default {
    name: 'Checkout',
    components: { cCheckout },
    props: { itemCheckout: Object, errors: Object }
}
</script>

<style></style>
