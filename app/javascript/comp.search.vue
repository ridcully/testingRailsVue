<template>
  <div class="row">
    <div class="col-11">
      <input class="form-control" type="text" name="search" placeholder="Search your notes" v-model="searchTerm" @keyup.enter="onSearch" />
    </div>
    <div class="col-1 nobr">
      <button class="btn btn-primary" @click="onSearch" title="Search for your term.">&gt;</button>
      <button class="btn btn-danger" @click="onReset" title="Reset search.">x</button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Search',
  props: ['search'],
  data() {
    return {searchTerm: this.search};
  },
  methods: {
    onReset() {
      this.searchTerm = '';
      this.onSearch();
    },
    onSearch() {
      this.$emit('note-search', this.searchTerm);
    }
  }
}
</script>

<style>
.nobr { white-space:nowrap; }
</style>