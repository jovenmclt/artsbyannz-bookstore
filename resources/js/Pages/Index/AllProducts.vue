<template>
    <cAllProductsVue :userCarts="userCart"  :get_allPremades="get_allPremade" />
</template>

<script>
import cAllProductsVue from '../Components/AllProducts/cAllProducts.vue'

export default {
    name:'AllProducts',
    components:{cAllProductsVue},
    props:{get_allPremade:Array, userCart: Object,}
}
</script>

<style>

</style>
