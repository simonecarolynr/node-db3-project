const db = require('../data/dbConfig')

function find() {
    return db("schemes")

}

function findById(id) {
    if(!id){
        return null
    }

    return db("schemes")
    .where({id})
    .first()
}

function findSteps(id) {
    return db("schemes as sch")
    .join("steps as st", "sch.id", "st.scheme_id")
    .select("st.id", "sch.scheme_name", "st.step_number", "st.instructions")
    .orderBy("st.step_number")
    .where("st.scheme_id", id)
}

function add(scheme) {
    return db("schemes")
    .insert(scheme)
    .then(id => {
        return findById(id[0])
    })
}

function addStep(step, schemeId) {
    return db("steps as st")
    .join("schemes as sch", "sch.id", "st.scheme_id")
    .insert(step)
    .into("steps")
}

function update(changes, id) {
    return db("schemes")
    .where({id})
    .update(changes)
}

function remove(id) {
    if(!id) {
        return null
    }

    return db("schemes")
    .where("id", id)
    .del()
}

module.exports = {
    find,
    findById,
    findSteps,
    add,
    addStep,
    update,
    remove
}