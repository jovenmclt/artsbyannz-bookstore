<template>
    <cRomancePremade :userCarts="userCart" :get_romanceItems="get_romanceItem" />
</template>

<script>
import cRomancePremade from '../Components/RomancePremade/cRomancePremade.vue';
export default {
    name: 'RomancePremade',
    components: {cRomancePremade},
    props: {get_romanceItem:Object, userCart: Object}
}
</script>

<style>

</style>
