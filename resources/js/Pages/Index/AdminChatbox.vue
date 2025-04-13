<template>
    <cAdminChatboxVue :getcAdmin_images="getAdminImage" :get_usersConvoInfo="get_usersConvoInfo" :get_readmessage="get_readmessage"/>
</template>

<script>
import cAdminChatboxVue from '../Components/AdminChatbox/cAdminChatbox.vue'

export default {
    name: 'AdminChatbox',
    components: {cAdminChatboxVue},
    props:{getAdminImage:Object, get_usersConvoInfo:Array, get_readmessage:Array}
}
</script>

<style>

</style>
