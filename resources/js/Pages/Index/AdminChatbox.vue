<template>
    <cAdminChatboxVue :getcAdmin_images="getAdminImage" :get_usersinfo="get_usersinfo"/>
</template>

<script>
import cAdminChatboxVue from '../Components/AdminChatbox/cAdminChatbox.vue'

export default {
    name: 'AdminChatbox',
    components: {cAdminChatboxVue},
    props:{getAdminImage:Object, get_usersinfo:Array, }
}
</script>

<style>

</style>
