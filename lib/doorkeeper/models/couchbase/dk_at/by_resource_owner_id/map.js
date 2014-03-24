function(doc) {
  if(doc.type === 'dk_at' && doc.resource_owner_id) {
    emit([doc.resource_owner_id], null);
  }
}
