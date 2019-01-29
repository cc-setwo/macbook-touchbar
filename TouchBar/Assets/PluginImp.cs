using UnityEngine;
using System.Collections;
using System.Runtime.InteropServices;

[ExecuteInEditMode]
public class PluginImp : MonoBehaviour {

	[DllImport ("tb-bundle")]
	private static extern int InitTB ();
	// Use this for initialization
	void Start ()
	{
		Debug.LogError(InitTB());
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
