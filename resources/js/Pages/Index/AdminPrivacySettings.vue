<template>
    <cAdminPrivacySettings :adminAccounts="adminAccount" :errors="errors" :getcAdmin_images="getAdminImage"/>
</template>

<script>
import cAdminPrivacySettings from '../Components/AdminPrivacySettings/cAdminPrivacySettings.vue';
export default {
    name: 'AdminPrivacySettings',
    components: {cAdminPrivacySettings},
    props:{adminAccount:Object, errors:Object, getAdminImage:Object },
}
</script>

<style>

</style>
