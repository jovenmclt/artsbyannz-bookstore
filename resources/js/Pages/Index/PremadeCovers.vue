<template>
    <cPremadeCovers :userCarts="userCart" :get_premadeCoverss="get_premadeCovers" />
</template>

<script>
import cPremadeCovers from '../Components/PremadeCovers/cPremadeCovers.vue';
export default {
    name: 'PremadeCovers',
    components: { cPremadeCovers },
    props: { get_premadeCovers: Object , userCart:Object}
}
</script>

<style></style>
