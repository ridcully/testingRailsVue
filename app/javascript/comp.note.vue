<template>
  <div>
    <div v-if="note" class="form-group">
      <label for="title">Title</label>
      <input class="form-control" type="text" v-model="note.title" name="title" placeholder="Your note title" />
      <label for="note">Note</label>
      <textarea class="form-control" name="note" v-model="note.note" placeholder="Your note." rows="6"></textarea>
      <hr />
      <div class="text-right">
        <button @click="onDelete()" class="btn btn-danger">Delete Note</button>
        <button @click="onSave()" class="btn btn-primary">Save Note</button>
      </div>
    </div>
    <div v-else>
      <h3>&larr; No note selected</h3>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Note',
  props: ['note'],
  methods: {
    onDelete () {
      this.$emit('note-delete')
    },
    onSave () {
      this.$emit('note-save')
    }
  }
}
</script>
