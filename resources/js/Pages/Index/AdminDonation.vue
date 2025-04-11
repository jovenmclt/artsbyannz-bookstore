<template>
    <cAdminDonationVue  :getcAdmin_images="getAdminImage" :get_allDonations="get_allDonation"/>
</template>

<script>
import cAdminDonationVue from '../Components/AdminDonation/cAdminDonation.vue'

export default {
    name: 'AdminDonation',
    components: {cAdminDonationVue},
    props: {getAdminImage:Object, get_allDonation:Array}
}
</script>

<style>

</style>
