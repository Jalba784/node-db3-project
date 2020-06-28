const db = require("../data/config");

function find() {
  return db("schemes").select("*");
}

function findById(schemeId) {
  return db("schemes as s")
    .where("s.id", schemeId)
    .select("*");
}

function findSteps(schemeId) {
  return db("schemes as sc")
    .join("steps as st", "st.scheme_id", "sc.id")
    .where("st.id", schemeId)
    .select("st.id", "sc.scheme_name", "st.step_number", "st.instructions")
    .orderBy("st.step_number");
}

function add(scheme) {
  return db("schemes")
    .insert(scheme)
    .then(ownObj => {
      return findById(ownObj[0]);
    });
}

function addStep(step, scheme_id) {
  const { id } = db("steps").insert({ ...step, scheme_id });
  return db("steps").where({ id });
}
function update(changes, id) {
  return db("schemes")
    .where({ id })
    .update(changes)
    .then(() => findById(id));
}
function remove(id) {
  return db("schemes").where({id}).del()
}

module.exports = {
  find,
  findById,
  findSteps,
  add,
  addStep,
  update,
  remove
};
