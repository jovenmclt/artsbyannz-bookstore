<template>
    <cMembershipLogin :userCarts="userCart" :flash_failedAuth="$page.props.flash.invalidAuth"  :flash_successStats="$page.props.flash.successStatus" :flash_failedStats="$page.props.flash.failedStatus"/>
</template>

<script>
import cMembershipLogin from '../Components/MembershipLogin/cMembershipLogin.vue';
export default {
    name: 'MembershipLogin',
    components: {cMembershipLogin},
    props:{userCart: Object}
}
</script>

<style>

</style>
