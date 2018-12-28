<template>
  <div>
    <ul class="list-group">
      <li
          class="list-group-item"
          v-for="(note, index) of notes"
          v-bind:class="{ 'active': index === activeNote }"
          @click="onChangeNote(index)"
          >
          <div>{{ note.Title }}
            <span class="badge badge-secondary" v-if="note.dirty">
              <template v-if="note.created_at">changed</template>
              <template v-else>new</template>
            </span></div>
      </li>
      <li class="list-group-item text-center" @click="onNewNote()">&lt; Add a Note &gt;</li>
    </ul>
  </div>
</template>

<script>
export default {
  name: 'NotebookList',
  props: ['notes', 'activeNote'],
  methods: {
    onChangeNote (index) {
      this.$emit('note-change', index)
    },
    onNewNote () {
      this.$emit('note-new')
    }
  }
}
</script>

<style>
li {
  cursor: pointer;
}
</style>
