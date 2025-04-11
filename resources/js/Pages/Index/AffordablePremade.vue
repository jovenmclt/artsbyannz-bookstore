<template>
    <cAffordablePremade :userCarts="userCart" :get_affordableItems="get_affordableItem"/>
</template>

<script>
import cAffordablePremade from '../Components/AffordablePremade/cAffordablePremade.vue';
export default {
    name: 'AffordablePremade',
    components: {cAffordablePremade},
    props: {get_affordableItem:Object, userCart: Object}

}
</script>

<style>

</style>
