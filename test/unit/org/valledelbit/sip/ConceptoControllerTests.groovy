package org.valledelbit.sip



import org.junit.*
import grails.test.mixin.*

@TestFor(ConceptoController)
@Mock(Concepto)
class ConceptoControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/concepto/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.conceptoInstanceList.size() == 0
        assert model.conceptoInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.conceptoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.conceptoInstance != null
        assert view == '/concepto/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/concepto/show/1'
        assert controller.flash.message != null
        assert Concepto.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/concepto/list'


        populateValidParams(params)
        def concepto = new Concepto(params)

        assert concepto.save() != null

        params.id = concepto.id

        def model = controller.show()

        assert model.conceptoInstance == concepto
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/concepto/list'


        populateValidParams(params)
        def concepto = new Concepto(params)

        assert concepto.save() != null

        params.id = concepto.id

        def model = controller.edit()

        assert model.conceptoInstance == concepto
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/concepto/list'

        response.reset()


        populateValidParams(params)
        def concepto = new Concepto(params)

        assert concepto.save() != null

        // test invalid parameters in update
        params.id = concepto.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/concepto/edit"
        assert model.conceptoInstance != null

        concepto.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/concepto/show/$concepto.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        concepto.clearErrors()

        populateValidParams(params)
        params.id = concepto.id
        params.version = -1
        controller.update()

        assert view == "/concepto/edit"
        assert model.conceptoInstance != null
        assert model.conceptoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/concepto/list'

        response.reset()

        populateValidParams(params)
        def concepto = new Concepto(params)

        assert concepto.save() != null
        assert Concepto.count() == 1

        params.id = concepto.id

        controller.delete()

        assert Concepto.count() == 0
        assert Concepto.get(concepto.id) == null
        assert response.redirectedUrl == '/concepto/list'
    }
}
