<template>
    <cUniquePremade :userCarts="userCart" :get_uniqueItems="get_uniqueItem"/>
</template>

<script>
import cUniquePremade from '../Components/UniquePremade/cUniquePremade.vue';
export default {
    name: 'UniquePremade',
    components:{cUniquePremade},
    props: {get_uniqueItem:Object, userCart: Object}
}
</script>

<style>

</style>
