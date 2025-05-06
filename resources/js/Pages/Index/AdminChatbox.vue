<template>
    <cAdminChatboxVue :getcAdmin_images="getAdminImage" :get_usersinfo="get_usersinfo" :get_unread="get_unread"/>
</template>

<script>
import cAdminChatboxVue from '../Components/AdminChatbox/cAdminChatbox.vue'

export default {
    name: 'AdminChatbox',
    components: {cAdminChatboxVue},
    props:{getAdminImage:Object, get_usersinfo:Array, get_unread:Array}
}
</script>

<style>

</style>
