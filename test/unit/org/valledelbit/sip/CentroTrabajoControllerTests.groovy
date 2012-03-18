package org.valledelbit.sip



import org.junit.*
import grails.test.mixin.*

@TestFor(CentroTrabajoController)
@Mock(CentroTrabajo)
class CentroTrabajoControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/centroTrabajo/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.centroTrabajoInstanceList.size() == 0
        assert model.centroTrabajoInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.centroTrabajoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.centroTrabajoInstance != null
        assert view == '/centroTrabajo/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/centroTrabajo/show/1'
        assert controller.flash.message != null
        assert CentroTrabajo.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/centroTrabajo/list'


        populateValidParams(params)
        def centroTrabajo = new CentroTrabajo(params)

        assert centroTrabajo.save() != null

        params.id = centroTrabajo.id

        def model = controller.show()

        assert model.centroTrabajoInstance == centroTrabajo
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/centroTrabajo/list'


        populateValidParams(params)
        def centroTrabajo = new CentroTrabajo(params)

        assert centroTrabajo.save() != null

        params.id = centroTrabajo.id

        def model = controller.edit()

        assert model.centroTrabajoInstance == centroTrabajo
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/centroTrabajo/list'

        response.reset()


        populateValidParams(params)
        def centroTrabajo = new CentroTrabajo(params)

        assert centroTrabajo.save() != null

        // test invalid parameters in update
        params.id = centroTrabajo.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/centroTrabajo/edit"
        assert model.centroTrabajoInstance != null

        centroTrabajo.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/centroTrabajo/show/$centroTrabajo.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        centroTrabajo.clearErrors()

        populateValidParams(params)
        params.id = centroTrabajo.id
        params.version = -1
        controller.update()

        assert view == "/centroTrabajo/edit"
        assert model.centroTrabajoInstance != null
        assert model.centroTrabajoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/centroTrabajo/list'

        response.reset()

        populateValidParams(params)
        def centroTrabajo = new CentroTrabajo(params)

        assert centroTrabajo.save() != null
        assert CentroTrabajo.count() == 1

        params.id = centroTrabajo.id

        controller.delete()

        assert CentroTrabajo.count() == 0
        assert CentroTrabajo.get(centroTrabajo.id) == null
        assert response.redirectedUrl == '/centroTrabajo/list'
    }
}
