<template>
    <cDonation :names="name" :messages="message" :errors="errors"/>
</template>

<script>
import cDonation from '../Components/Donation/cDonation.vue';
export default {
    name: 'Donation',
    components: {cDonation},
    props: {name:String, message:String, errors: Object}
}
</script>

<style>

</style>
