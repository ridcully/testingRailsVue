<template>
  <div class="row">
    <div class="col-11">
      <input class="form-control" type="text" name="search" placeholder="Search your notes" v-model="searchTerm" @keyup.enter="onSearch" />
    </div>
    <div class="col-1">
      <button class="btn btn-primary" @click="onSearch">&gt;</button>
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
    onSearch() {
      this.$emit('note-search', this.searchTerm);
    }
  }
}
</script>
