<template>
    <cCart :userCarts="userCart" :get_latestItems="get_latestItem" />
</template>

<script>
import cCart from '../Components/Cart/cCart.vue';
export default {
    name: 'Cart',
    components: { cCart },
    props: { userCart: Object, get_latestItem: Array }
}
</script>

<style></style>
