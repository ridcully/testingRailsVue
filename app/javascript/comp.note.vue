<template>
  <div>
    <div v-if="note" class="form-group">
      <label for="title">Title</label>
      <input class="form-control" type="text" v-model="note.Title" name="title" placeholder="Your note title." @keyup="onModified()" />
      <label>Tags</label>
      <input v-model="tags" class="form-control" type="text" name="tags" placeholder="Your tags. (Comma seperated)" @keyup="onModified()" />
      <label for="note">Note</label>
      <textarea class="form-control" name="note" v-model="note.Note" placeholder="Your note." rows="6" @keyup="onModified()"></textarea>
      <label for="note">Link</label>
      <input class="form-control" type="text" v-model="note.Link" name="link" placeholder="Your note link." @keyup="onModified()" />
      <small v-if="note.Link"><a :href="note.Link" target="blank">Vist {{note.Link}}</a></small>
      <hr />
      <span v-if="note.created_at">
        <small>Created: {{ note.created_at }}</small><br>
        <small>Updated: {{ note.updated_at }}</small><br>
        <hr />
      </span>
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
  computed: {
    tags: {
      get: function() {
        let all = [];
        for (let i in this.note.tags) {
          all.push(this.note.tags[i].Name);
        }

        return all.join(',');
      },
      set: function(tags) {
        let out = [];
        let all = tags.split(',')

        for (let i in all) {
          out.push({Name: all[i]});
        }
        this.note.tags = out;

        this.onModified();
      }
    }
  },
  methods: {
    onDelete() {
      this.$emit('note-delete');
    },
    onSave() {
      this.$emit('note-save');
    },
    onModified() {
      this.note.dirty = true;
    }
  }
}
</script>
