<template>
    <cadminVue :flash_failedAuth="$page.props.flash.invalidAuth"/>
</template>

<script>
import cadminVue from '../Components/Admin/cadmin.vue'
export default {
    name:'cadmin',
    components:{cadminVue}
}
</script>

<style>

</style>
