<template>
    <cAdminMessage :getcAdmin_images="getAdminImage" :get_membermessage="get_membermessage" :get_authId="get_authId" :memberInfo="memberInfo" />
</template>

<script>
import cAdminMessage from '../Components/AdminMessage/cAdminMessage.vue';
export default {
    name: 'AdminMessage',
    components:{cAdminMessage},
    props:{getAdminImage:Object, get_membermessage:Array, get_authId:Number, memberInfo:Object}
}
</script>

<style>

</style>
